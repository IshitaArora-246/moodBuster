class UserModel {
  UserModel({
    this.doc,
    this.uid,
  });

  final String uid;
  Map<String, dynamic> doc;

  factory UserModel.empty() => UserModel();

  bool get isEmpty => (doc == null);
}
