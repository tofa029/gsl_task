import '../index.dart';

///contact Entity to convert api json data to dart vars

class ContactEntity {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? department;
  String? address;
  String? imageUrl;
  List<Roles>? roles;

  ContactEntity(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.department,
        this.address,
        this.imageUrl,
        this.roles});

  factory ContactEntity.fromJson(Map<String, dynamic> json) {
    return ContactEntity(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      department: json['department'],
      imageUrl: json['image_url'],
      address: json['address'],
      roles: json['roles'] != null
          ? (json['roles'] as List).map((v) => Roles.fromJson(v)).toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['department'] = department;
    data['image_url'] = imageUrl;
    data['address'] = address;
    if (roles != null) {
      data['roles'] = roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
