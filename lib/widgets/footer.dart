import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenHeight * 0.35,
        width: screenWidth,
        color: Color(0XFF353535),
        child: Container(
          height: 25,
          color: Color(0XFF292929),
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Container(
                      width: screenWidth * 0.7,
                      child: Row(children: [
                        Container(
                            width: screenWidth * 0.25,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "• Feedback\n\n• Cookie Policy\n\n• Privacy Policy",
                                    style: TextStyle(color: Colors.white))
                              ],
                            )),
                        Container(
                            width: screenWidth * 0.25,
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "• Terms and Conditions\n\n• Our Team\n\n• FAQ's",
                                    style: TextStyle(color: Colors.white))
                              ],
                            )),
                      ])),
                  Container(
                      width: screenWidth * 0.3,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Connect With Us",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    icon: FaIcon(FontAwesomeIcons.facebookF),
                                    color: Colors.indigo,
                                    onPressed: () {}),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    icon: FaIcon(FontAwesomeIcons.instagram),
                                    color: Colors.pink,
                                    onPressed: () {}),
                              ),
                              Spacer(),
                            ],
                          ),
                          Row(
                            children: [
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    icon: FaIcon(FontAwesomeIcons.pinterestP),
                                    color: Colors.red,
                                    onPressed: () {}),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                    icon: FaIcon(FontAwesomeIcons.twitter),
                                    color: Colors.blue,
                                    onPressed: () {}),
                              ),
                              Spacer(),
                            ],
                          )
                        ],
                      )),
                ],
              )),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("2021 \u00a9 All rights reserved || Mood Buster",
                      style: TextStyle(color: Colors.white)),
                ),
                Spacer()
              ]),
            ],
          ),
        ));
  }
}
