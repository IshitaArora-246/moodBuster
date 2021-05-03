import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/screens/homepage/footer.dart';
import 'package:moodbuster/screens/homepage/landing_about.dart';
import 'package:moodbuster/screens/homepage/landing_blog.dart';
import 'package:moodbuster/screens/homepage/landing_chat.dart';
import 'package:moodbuster/screens/homepage/landing_expert.dart';
import 'package:moodbuster/screens/homepage/landing_main.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: lightskin,
      child: SingleChildScrollView(
        child: Column(
          children: [
            LandingPage(),
            LandingBlogPage(),
            LandingExpertPage(),
            LandingChatPage(),
            LandingAboutPage(),
            SizedBox(height: 20),
            Footer(),
            Container(
              color: Color(0XFF282828),
              width: screenWidth,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2021 \u00a9 All rights reserved || Mood Buster",
                      style: TextStyle(color: Colors.white)),
                ),
                Spacer()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
