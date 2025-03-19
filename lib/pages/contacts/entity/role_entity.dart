///role Entity to convert api json data to dart vars
///
class Roles {
  int? roleId;
  String? name;
  String? managerName;
  String? group;

  Roles({this.roleId, this.name, this.managerName, this.group});

  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(
      roleId: json['role_id'],
      name: json['name'],
      managerName: json['manager_name'],
      group: json['group'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['role_id'] = roleId;
    data['name'] = name;
    data['manager_name'] = managerName;
    data['group'] = group;
    return data;
  }
}