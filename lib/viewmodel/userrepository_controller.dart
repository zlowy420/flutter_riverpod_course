import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_course/model/userrepository_service.dart';
import 'package:riverpod_course/objects/user_model.dart';

final userRepositoryControllerProvider = Provider<UserRepositoryController>(
    (ref) => UserRepositoryController(ref.read));

class UserRepositoryController {
  final Reader _reader;
  UserRepositoryController(this._reader);

  Future<void> addUser(UserModel userToAdd) async {
    await _reader(userRepositoryServiceProvider).addUser(userToAdd.toJson());
  }

  Future<void> updateUser(UserModel userToChange) async {
    await _reader(userRepositoryServiceProvider)
        .updateUser(userToChange.toJson());
  }

  Future<UserModel> getUser(String uid) async {
    Map<String, dynamic> user =
        await _reader(userRepositoryServiceProvider).getUser(uid);
    return UserModel.fromJson(user);
  }

  Stream<UserModel> getUserStream(String uid) {
    var firebaseStream =
        _reader(userRepositoryServiceProvider).getUserStream(uid);
    return firebaseStream.map(
        (event) => UserModel.fromJson(event.data() as Map<String, dynamic>));
  }
}
