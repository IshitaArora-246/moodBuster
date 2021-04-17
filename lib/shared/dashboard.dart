import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moodbuster/screens/about_us.dart';
import 'package:moodbuster/screens/blog_page.dart';
import 'package:moodbuster/screens/chat_forum.dart';
import 'package:moodbuster/screens/home_page.dart';
import 'package:moodbuster/screens/suggestions_page.dart';
import 'package:moodbuster/shared/navbar.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  String currentPage = 'home';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    bool showDrawer = false;
    if (screenWidth < 815) showDrawer = true;

    return Scaffold(
      endDrawer: showDrawer
          ? Container(
              width: screenWidth * 0.6,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Colors.white.withOpacity(0.9),
                    Colors.white.withOpacity(0.8)
                  ])),
              child: ListView(
                children: [
                  SizedBox(height: 100),
                  drawerItems(context, "HOME"),
                  drawerItems(context, "BLOGS"),
                  drawerItems(context, "MOVIES/SERIES"),
                  drawerItems(context, "CHAT FORUM"),
                  drawerItems(context, "ABOUT US")
                ],
              ))
          : null,
      body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/home_bg.jpg"),
                        fit: BoxFit.cover)),
              ),
              getCurrentPage(currentPage),
              NavBar(
                parent: this,
              ),
            ],
          )),
    );
  }

  Widget drawerItems(context, String pageTitle) {
    return ListTile(
      title: Text(pageTitle,
          style: TextStyle(
              fontSize: 20, letterSpacing: -1, fontWeight: FontWeight.bold)),
    );
  }

  Widget getCurrentPage(String currentPage) {
    switch (currentPage) {
      case "home":
        return HomePage();
        break;
      case "blog":
        return BlogPage();
        break;
      case "suggestion":
        return SuggestionsPage();
        break;
      case "chat":
        return ChatForum();
        break;
      case "about":
        return AboutUs();
        break;
      default:
        return Container();
    }
  }
}
