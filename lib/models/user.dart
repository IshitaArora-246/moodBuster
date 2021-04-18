import 'package:meta/meta.dart';

@immutable
class User1 {
  const User1({
    @required this.uid,
    this.email,
    this.displayName,
  });

  final String uid;
  final String email;
  final String displayName;
}
