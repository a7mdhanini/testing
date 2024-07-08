class UserModel {
  String id;
  String email;
  String password;
  String cPassword;
  String name;
  bool isAdmin;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.cPassword,
    required this.name,
    required this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      cPassword: json['password'],
      name: json['name'],
      isAdmin: json['is_admin'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'is_admin': isAdmin,
    };
  }
}
