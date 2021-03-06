import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hovering/hovering.dart';
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
      width: screenWidth,
      color: lightskin,
      padding: EdgeInsets.only(top: screenHeight * 0.1),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 815) {
          return Row(
            children: [
              Container(
                  width: screenWidth * 0.5,
                  child: Image.asset(
                    "assets/images/talkExpert.png",
                    fit: BoxFit.contain,
                  )),
              Container(
                  width: screenWidth * 0.45,
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 50),
                        Text(
                          "We're here for you during COVID-19",
                          style: headingStyle.copyWith(
                              fontSize: 30, fontWeight: FontWeight.w800),
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
                                  // boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 5)],
                                  borderRadius: BorderRadius.circular(50)),
                              child: Center(
                                child: Text("Talk to us",
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
            Container(
                width: screenWidth * 0.5,
                child: Image.asset(
                  "assets/images/talkExpert.png",
                  fit: BoxFit.contain,
                )),
            Container(
                width: screenWidth,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "We're here for you during COVID-19",
                        style: headingStyle.copyWith(
                            fontSize: 28, fontWeight: FontWeight.w800),
                        maxLines: 4,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 35),
                      Text(
                        "Click the link below to find out how you can seek support and get access to resources, tools and useful information to help you during this time.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        maxLines: 20,
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
                              child: Text("Talk to us",
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
