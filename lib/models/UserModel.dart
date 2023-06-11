class UserModel {
  UserModel({
    required this.pk,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(dynamic json) => UserModel(
        pk: json['pk'],
        username: json['username'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
      );
  int pk;
  String username;
  String email;
  String firstName;
  String lastName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pk'] = pk;
    map['username'] = username;
    map['email'] = email;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    return map;
  }
}
