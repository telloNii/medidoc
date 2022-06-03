class UserModel {
  late String uid;
  late String username;

  late String email;
  late String profileImage;
  late int dt;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.dt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      username: map['userName'],
      email: map['email'],
      profileImage: map['profileImage'],
      dt: map['date_joined'],
    );
  }
}
