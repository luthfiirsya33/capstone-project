class UserModel {
  String? uid;
  String? email;
  String? nickname;
  String? telegram;
  String? instagram;
  String? gitlab;
  String? linkedIn;
  String? imageUrl;

  UserModel(
      {this.uid,
      this.email,
      this.nickname,
      this.telegram,
      this.instagram,
      this.gitlab,
      this.linkedIn,
      this.imageUrl});

  // Menerima data dari server firebase
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'],
        email: map['email'],
        nickname: map['nickname'],
        telegram: map['telegram'],
        instagram: map['instagram'],
        gitlab: map['gitlab'],
        linkedIn: map['linkedIn'],
        imageUrl: map['imageUrl']);
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
