import 'package:meta/meta.dart';

@immutable
class UserModel {
  const UserModel({
    this.doc,
    this.uid,
  });

  final String uid;
  final Map<String, dynamic> doc;

  factory UserModel.empty() => UserModel();

  bool get isEmpty => (doc == null);
}
