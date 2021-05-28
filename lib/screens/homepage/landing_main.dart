import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home_bg.jpg"),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          screenWidth < 500
              ? AutoSizeText("Mood Buster",
                  maxLines: 1,
                  style: TextStyle(fontSize: 70, fontFamily: rouge))
              : AutoSizeText("Mood Buster",
                  maxLines: 1,
                  style: TextStyle(fontFamily: rouge, fontSize: 110)),
          Text("Say yes to positivity",
              style: TextStyle(fontSize: 30, fontFamily: paraFont)),
        ],
      ),
    );
  }
}
