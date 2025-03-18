/// example of singleton


class User {

  ///to hold only one instance until clear
  static User? _instance;

  User._();

  ///ensure only one instance is used.
  factory User() {
    return _instance ??= User._();
  }

  ///normal vars to store necessary things
  String? _userName;
  String? _userRole;
  List<String>? _userTask;

  ///getting variable values
  String? get userName => _userName;
  String? get userRole => _userRole;
  List<String>? get userTask => _userTask;

  ///setting variable values
  void setUserName(String name) => _userName = name;
  void setUserRole(String role) => _userRole = role;
  void setUserTask(String taskName) {
    (_userTask??[]).add(taskName);
  }

  ///clean the created instance if necessary
  void clear(){
    _instance = null;
  }

}