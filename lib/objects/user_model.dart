enum UserAuthenticationState { incomplete, complete }

class UserModel {
  final String _uid;
  String get uid => _uid;
  final UserAuthenticationState _userAuthenticationState;
  UserAuthenticationState get userAuthenticationState =>
      _userAuthenticationState;

  UserModel(this._uid, this._userAuthenticationState);
}
