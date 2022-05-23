class UserModel {
  String? uid;
  String? email;
  String? nickname;

  UserModel({this.uid, this.email, this.nickname});

  // Menerima data dari server firebase
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      nickname: map['nickname'],
    );
  }

  // Mengirim data ke server firebase
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'nickname': nickname,
    };
  }
}
