import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodbuster/shared/navbar.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
                        fit: BoxFit.fill)),
              ),
              NavBar(),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Mood Buster",
                        style: GoogleFonts.rougeScript(
                            textStyle: TextStyle(fontSize: 110))),
                    Text("Say yes to positivity",
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(fontSize: 30))),
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
                                    // offset: Offset.zero,
                                    spreadRadius: 2,
                                    blurRadius: 10)
                              ],
                              color: Colors.white54,
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text("Get Started",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          )),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
