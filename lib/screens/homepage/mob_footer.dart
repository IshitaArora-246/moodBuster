import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MobFooter extends StatelessWidget {
  const MobFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: 550,
        width: screenWidth,
        color: Color(0XFF353535),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 30, bottom: 20),
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
            Text("Quick links",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Text("\nOur Team\n\nTerms and Conditions\n\nPrivacy Policy\n\n",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white)),
            Container(
                width: screenWidth * 0.9,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text("Connect With Us",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
        ));
  }
}
