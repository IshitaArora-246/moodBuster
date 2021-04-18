import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({
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
                  style: GoogleFonts.rougeScript(
                      textStyle: TextStyle(fontSize: 70)))
              : AutoSizeText("Mood Buster",
                  maxLines: 1,
                  style: GoogleFonts.rougeScript(
                      textStyle: TextStyle(fontSize: 110))),
          Text("Say yes to positivity",
              style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 30))),
          SizedBox(height: 40),
          InkWell(
            onTap: () async {
              var query =
                  await FirebaseFirestore.instance.collection('users').get();
              print(query.docs.first.data());
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
                  child: Text("Get Started",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                )),
          )
        ],
      ),
    );
  }
}
