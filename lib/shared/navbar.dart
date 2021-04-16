import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/blogPage.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: screenHeight * 0.1,
        width: screenWidth,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.grey[200].withOpacity(0.2),
                Colors.grey[400].withOpacity(0.2),
              ]),
        ),
        child: Container(
          width: screenWidth * 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 20),
                        child: Text("MB",
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 40,
                                  letterSpacing: -10),
                            ))),
                    navLinks(context, "HOME"),
                    navLinks(context, "BLOGS"),
                    navLinks(context, "MOVIES/SERIES"),
                    navLinks(context, "CHAT FORUM"),
                    navLinks(context, "ABOUT US"),
                  ],
                ),
                InkWell(
                  hoverColor: Colors.red[200].withOpacity(0.9),
                  onTap: () {
                    print("Login Button tapped!");
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.brown[200],
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text("Login/Sign-up",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                letterSpacing: 1.05,
                                fontWeight: FontWeight.bold))),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget navLinks(BuildContext context, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BlogPage()));
        },
        child: Container(
            child: Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }
}
