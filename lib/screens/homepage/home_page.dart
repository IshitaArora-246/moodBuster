import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/screens/homepage/footer.dart';
import 'package:moodbuster/screens/homepage/landing_about.dart';
import 'package:moodbuster/screens/homepage/landing_blog.dart';
import 'package:moodbuster/screens/homepage/landing_chat.dart';
import 'package:moodbuster/screens/homepage/landing_expert.dart';
import 'package:moodbuster/screens/homepage/landing_main.dart';
import 'package:moodbuster/screens/homepage/mob_footer.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  ScrollController scrollCtrl = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(alignment: Alignment.bottomRight, children: [
        Container(
          height: screenHeight,
          color: lightskin,
          child: SingleChildScrollView(
            controller: scrollCtrl,
            child: Column(
              children: [
                LandingPage(),
                LandingBlogPage(),
                LandingExpertPage(),
                LandingChatPage(),
                LandingAboutPage(),
                SizedBox(height: 20),
                screenWidth > 815 ? Footer() : MobFooter(),
                Container(
                  color: Color(0XFF282828),
                  width: screenWidth,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "2021 \u00a9 All rights reserved || Mood Buster",
                              style: TextStyle(color: Colors.white)),
                        ),
                        Spacer()
                      ]),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: scrollToTop,
          child: Container(
            margin: EdgeInsets.only(right: 40, bottom: 40),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0.8,
                      color: Colors.brown[900],
                      blurRadius: 3)
                ],
                color: Color(0XFFC19A6B).withOpacity(0.9),
                borderRadius: BorderRadius.circular(50)),
            child: Icon(
              Icons.expand_less,
              size: 38,
            ),
          ),
        )
      ]),
    );
  }

  void scrollToTop() {
    scrollCtrl.animateTo(
      0,
      duration: Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }
}
