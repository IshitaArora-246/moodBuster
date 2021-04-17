import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText("Mood Buster",
              maxLines: 1,
              style:
                  GoogleFonts.rougeScript(textStyle: TextStyle(fontSize: 110))),
          Text("Say yes to positivity",
              style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 30))),
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
