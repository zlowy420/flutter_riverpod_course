import 'package:firebase_auth/firebase_auth.dart';

enum UserCompletionState { incomplete, complete }

String userCompletionStateString = "userCompletionState";
String uidString = "uid";

class UserModel {
  final String _uid;
  String get uid => _uid;
  UserCompletionState _userCompletionState;
  UserCompletionState get userCompletionState => _userCompletionState;
  set userCompletionState(newCompletionState) =>
      _userCompletionState = newCompletionState;

  UserModel(this._uid, this._userCompletionState);

  UserModel.fromJson(Map<String, dynamic> userJSON)
      : _uid = userJSON[uidString] ?? "",
        _userCompletionState = (userJSON[userCompletionStateString] != null)
            ? UserCompletionState.values[userJSON[userCompletionStateString]]
            : UserCompletionState.incomplete;

  Map<String, dynamic> toJson() =>
      {uidString: _uid, userCompletionStateString: _userCompletionState.index};
}
