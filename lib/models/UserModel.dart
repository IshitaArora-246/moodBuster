import 'package:meta/meta.dart';

@immutable
class UserModel {
  const UserModel({
    this.uid,
  });

  final String uid;
  static Map<String, dynamic> doc;

  factory UserModel.empty() => UserModel();

  bool get isEmpty => (doc == null);
}
