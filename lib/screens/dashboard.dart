import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moodbuster/screens/about_us.dart';
import 'package:moodbuster/screens/blog_page.dart';
import 'package:moodbuster/screens/chat_forum.dart';
import 'package:moodbuster/screens/home_page.dart';
import 'package:moodbuster/screens/suggestions_page.dart';
import 'package:moodbuster/widgets/my_drawer.dart';
import 'package:moodbuster/widgets/navbar.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoard> {
  String currentPage = 'home';
  List navItems;

  @override
  void initState() {
    super.initState();
    navItems = [
      {
        'name': 'Home',
        'onTap': () {
          setState(() {
            currentPage = 'home';
          });
        },
      },
      {
        'name': 'Blogs',
        'onTap': () {
          setState(() {
            currentPage = 'blog';
          });
        },
      },
      {
        'name': 'Movies/Series',
        'onTap': () {
          setState(() {
            currentPage = 'suggestion';
          });
        },
      },
      {
        'name': 'Chat Forum',
        'onTap': () {
          setState(() {
            currentPage = 'chat';
          });
        },
      },
      {
        'name': 'About Us',
        'onTap': () {
          setState(() {
            currentPage = 'about';
          });
        },
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    bool showDrawer = false;
    if (screenWidth < 815) showDrawer = true;

    return Scaffold(
      endDrawer: showDrawer
          ? MyDrawer(
              navItems: navItems,
            )
          : null,
      body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              getCurrentPage(currentPage),
              NavBar(
                parent: this,
              ),
              TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog());
                  },
                  child: Text("Press"))
            ],
          )),
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
