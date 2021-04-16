import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodbuster/shared/navbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'home.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool showDrawer = false;
    if (screenWidth < 815) showDrawer = true;
    return Scaffold(
      endDrawer: showDrawer
          ? Container(
              color: Colors.blue,
              width: screenWidth * 0.6,
            )
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
              NavBar(),
              HomePage(),
            ],
          )),
    );
  }
}
