import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/utils/authentication.dart';
import 'package:moodbuster/widgets/dialog_box.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
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
              onTap: () {
                print("Login Button tapped!");

                _showMenuDialog(context);
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _showMenuDialog(BuildContext context) {
    Widget dialog = ShowMenuDialogBox();
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
