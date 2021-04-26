import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';

class LandingChatPage extends StatelessWidget {
  const LandingChatPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: lightskin,
      child: Row(
        children: [
          Container(
              width: screenWidth * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Build Community",
                      style: headingStyle.copyWith(
                          fontSize: 40, fontWeight: FontWeight.w800),
                      maxLines: 1,
                    ),
                    SizedBox(height: 35),
                    Text(
                      "Group chats allow you to connect with other people like you and build a community. Group chats explore a range of helpful topics.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[900].withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ],
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text("Join In",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          )),
                    )
                  ])),
          Container(
              width: screenWidth * 0.5,
              child: Image.asset(
                "assets/images/page1Chat.png",
                fit: BoxFit.contain,
              )),
        ],
      ),
    );
  }
}
