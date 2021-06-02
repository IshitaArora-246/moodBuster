import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';
import 'package:moodbuster/constants/textStyle.dart';

class LandingAboutPage extends StatelessWidget {
  const LandingAboutPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: lightskin,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 815) {
          return Row(
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
                        HoverButton(
                          onpressed: () {},
                          hoverColor: tan.withOpacity(0.5),
                          child: Container(
                              width: 200,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: tan.withOpacity(0.4),
                                  border: Border.all(
                                    color: tan.withOpacity(0.4),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text("Get to know us",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              )),
                        )
                      ]))
            ],
          );
        }
        return Column(
          children: [
            SizedBox(height: 80),
            Container(
                width: screenWidth * 0.6,
                child: Image.asset(
                  "assets/images/about.png",
                  fit: BoxFit.contain,
                )),
            Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "About Us",
                        style: headingStyle.copyWith(
                            fontSize: 28, fontWeight: FontWeight.w800),
                        maxLines: 1,
                      ),
                      SizedBox(height: 35),
                      Text(
                        "Mood Buster is a growing community working towards changing the way individuals think & act about problems related to Mental Health",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 4,
                      ),
                      SizedBox(height: 40),
                      HoverButton(
                        onpressed: () {},
                        hoverColor: tan.withOpacity(0.5),
                        child: Container(
                            width: 200,
                            height: 60,
                            decoration: BoxDecoration(
                                color: tan.withOpacity(0.4),
                                border: Border.all(
                                  color: tan.withOpacity(0.4),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text("Get to know us",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            )),
                      )
                    ]))
          ],
        );
      }),
    );
  }
}
