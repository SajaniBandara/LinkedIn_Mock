class UserModel {
  final String email;
  final String password;
  final String fullName;
  final String bio;
  final String profileImage;
  final String bannerImage;

  UserModel({
    required this.email,
    required this.password,
    required this.fullName,
    required this.bio,
    this.profileImage = 'assets/images/user5.jpg',
    this.bannerImage = 'assets/images/background.png',
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'bio': bio,
      'profileImage': profileImage,
      'bannerImage': bannerImage,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final profile = json['profileImage'];
    final banner = json['bannerImage'];

    return UserModel(
      email: json['email'],
      password: json['password'],
      fullName: json['fullName'],
      bio: json['bio'],
      profileImage: (profile != null && profile.trim().isNotEmpty)
          ? profile
          : 'assets/images/user5.jpg',
      bannerImage: (banner != null && banner.trim().isNotEmpty)
          ? banner
          : 'assets/images/background.png',
    );
  }
}
