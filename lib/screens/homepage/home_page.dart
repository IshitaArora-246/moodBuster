import 'package:flutter/material.dart';
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
    return Material(
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
          ],
        ),
      ),
    );
  }
}
