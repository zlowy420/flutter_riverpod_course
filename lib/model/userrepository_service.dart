import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_course/objects/user_model.dart';

final userRepositoryServiceProvider = Provider<UserRepositoryService>((ref) =>
    UserRepositoryService(FirebaseFirestore.instance.collection("users")));

class UserRepositoryService {
  final CollectionReference _userCollectionReference;
  UserRepositoryService(this._userCollectionReference);

  Future<void> addUser(Map<String, dynamic> userToAdd) async {
    await _userCollectionReference.doc(userToAdd[uidString]).set(userToAdd);
  }

  Future<void> updateUser(Map<String, dynamic> userToUpdate) async {
    await _userCollectionReference
        .doc(userToUpdate[uidString])
        .update(userToUpdate);
  }

  Future<Map<String, dynamic>> getUser(String uid) async {
    var retUser = await _userCollectionReference
        .where(uidString, isEqualTo: uid)
        .limit(1)
        .get();
    return retUser.docs.first.data() as Map<String, dynamic>;
  }

  Stream getUserStream(String uid) {
    return _userCollectionReference.doc(uid).snapshots();
  }
}
