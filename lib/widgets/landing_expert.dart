import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';


class LandingExpertPage extends StatelessWidget {
  const LandingExpertPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight,
      width: screenWidth,
      color: lightskin,
      padding: EdgeInsets.only(top: screenHeight * 0.1),
      child: Row(
        children: [
          Container(
              width: screenWidth * 0.5,
              child: Image.asset(
                "assets/images/talkExpert.png",
                fit: BoxFit.contain,
              )),
          Container(
              width: screenWidth * 0.5,
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "We're here for you during COVID-19",
                      style: headingStyle.copyWith(
                          fontSize: 40, fontWeight: FontWeight.w800),
                      maxLines: 4,
                    ),
                    SizedBox(height: 35),
                    Text(
                      "Click the link below to find out how you can seek support and get access to resources, tools and useful information to help you during this time.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      maxLines: 20,
                    ),
                    SizedBox(height: 40),
                    InkWell(
                      onTap: () {
                        print("Talk to Experts!!");
                      },
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
                            child: Text("Talk to Experts",
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