enum UserAuthenticationState { incomplete, complete }

class UserModel {
  String _uid;
  String get uid => _uid;
  UserAuthenticationState _userAuthenticationState;
  UserAuthenticationState get userAuthenticationState => _userAuthenticationState;

  UserModel(this._uid, this._userAuthenticationState)
}
