import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';

class LandingAboutPage extends StatelessWidget {
  const LandingAboutPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      color: lightskin,
      child: Row(
        children: [
          Container(
              width: screenWidth * 0.5,
              child: Image.asset(
                "assets/images/about.png",
                fit: BoxFit.contain,
              )),
          Container(
              width: screenWidth * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "About Us",
                      style: headingStyle.copyWith(
                          fontSize: 40, fontWeight: FontWeight.w800),
                      maxLines: 1,
                    ),
                    SizedBox(height: 35),
                    Text(
                      "Mood Buster is a growing community working towards changing the way individuals think & act about problems related to Mental Health",
                      style: TextStyle(
                        fontSize: 20,
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
                            child: Text("Get to know us",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          )),
                    )
                  ]))
        ],
      ),
    );
  }
}
