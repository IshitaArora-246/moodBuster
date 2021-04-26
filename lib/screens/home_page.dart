import 'package:flutter/material.dart';
import 'package:moodbuster/widgets/footer.dart';
import 'package:moodbuster/widgets/landing_about.dart';
import 'package:moodbuster/widgets/landing_blog.dart';
import 'package:moodbuster/widgets/landing_chat.dart';
import 'package:moodbuster/widgets/landing_expert.dart';
import 'package:moodbuster/widgets/landing_main.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          LandingPage(),
          LandingBlogPage(),
          LandingExpertPage(),
          LandingChatPage(),
          LandingAboutPage(),
          Footer(),
        ],
      ),
    );
  }
}










