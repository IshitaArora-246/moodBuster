import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    width: screenWidth * 0.3,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                              margin: EdgeInsets.only(left: 65, top: 30),
                              child: Text("MB",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 100,
                                        letterSpacing: -25),
                                  ))),
                        ),
                      ],
                    )),
                Container(
                    width: screenWidth * 0.3,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Quick links",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text(
                            "\nOur Team\n\nTerms and Conditions\n\nPrivacy Policy",
                            style: TextStyle(color: Colors.white))
                      ],
                    )),
                Container(
                    width: screenWidth * 0.4,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("Connect With Us",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          children: [
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: FaIcon(FontAwesomeIcons.pinterestP),
                                  color: Colors.red,
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: FaIcon(FontAwesomeIcons.twitter),
                                  color: Colors.blue,
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: FaIcon(FontAwesomeIcons.youtube),
                                  color: Colors.red[700],
                                  onPressed: () {}),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                  icon: FaIcon(FontAwesomeIcons.github),
                                  color: Colors.grey,
                                  onPressed: () {}),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ));
  }
}
