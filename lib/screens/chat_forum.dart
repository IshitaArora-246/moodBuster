import 'package:flutter/material.dart';

class ChatForum extends StatelessWidget {
  const ChatForum({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [Center(child: Text("This is Chat page"))],
      )),
    );
  }
}