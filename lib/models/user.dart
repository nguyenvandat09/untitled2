class User {
  final int id;
  final String avatarUser;
  final String username;
  final String password;
  final String name;
  final String email;
  final String phone;
  final String gender;
  final String address;
  final bool? isActive;

  User({
    required this.id,
    required this.avatarUser,
    required this.username,
    required this.phone,
    required this.name,
    required this.password,
    required this.email,
    required this.gender,
    required this.address,
    required this.isActive
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      avatarUser: json['avatarUser']?? '',
      username: json['username'] ?? '',
      phone:json['phone'] ?? '',
      name: json['name'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      address: json['address'] ?? '',
      isActive: json['isActive'] ?? false,
    );
  }

}