import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/widgets/dialog_box.dart';

class LandingChatPage extends StatelessWidget {
  const LandingChatPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
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
                      "Group chats allow you to connect with other people like you and build a community.Group chats explore a\nrange of helpful topics.",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(height: 40),
                    HoverButton(
                      onpressed: () {
                        _showMenuDialog(context);
                      },
                      hoverColor: tan.withOpacity(0.5),
                      child: Container(
                          width: 200,
                          height: 60,
                          decoration: BoxDecoration(
                              color: tan.withOpacity(0.4),
                              border: Border.all(
                                color: tan.withOpacity(0.4),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(50)),
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

  void _showMenuDialog(BuildContext context) {
    Widget dialog = ShowMenuDialogBox();
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
