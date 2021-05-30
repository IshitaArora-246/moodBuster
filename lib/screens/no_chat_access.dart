import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';

class NoChatAccess extends StatelessWidget {
  const NoChatAccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: lightskin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/chat.png", height: 300, width: 300),
            Text("Login or Sign-Up to access the chat forum",
                style: TextStyle(
                    color: Colors.brown,
                    fontSize: 30,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
