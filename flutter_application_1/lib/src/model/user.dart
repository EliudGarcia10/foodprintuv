class User {
  String _nameuser = '';
  String _password = '';

  User();

  String get nameuser => _nameuser;

  set nameuser(String value) {
    _nameuser = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }
}
