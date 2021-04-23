import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:moodbuster/utils/authentication.dart';

class ShowMenuDialogBox extends StatefulWidget {
  const ShowMenuDialogBox({
    Key key,
  }) : super(key: key);

  @override
  _ShowMenuDialogBoxState createState() => _ShowMenuDialogBoxState();
}

class _ShowMenuDialogBoxState extends State<ShowMenuDialogBox> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.only(bottom: 50, right: 15),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          height: screenHeight * 0.7,
          width: screenWidth * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Form(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Spacer(),
                    Center(
                      child: Text("Sign-up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    Spacer(),
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  style: TextStyle(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0XFFA6DAE8), width: 2),
                    ),
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(fontWeight: FontWeight.w500),
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0XFFA6DAE8), width: 2),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: screenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Color(0XFFA6DAE8), Color(0XFFB9B2DC)])),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87)),
                  ),
                ),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Divider(
                          color: Colors.grey,
                          height: 50,
                        )),
                  ),
                  Text("OR",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                        child: Divider(
                          color: Colors.grey,
                          height: 50,
                        )),
                  ),
                ]),
                InkWell(
                  onTap: () async {
                    await context
                        .read<FirebaseAuthService>()
                        .signInWithGoogle();

                    if (!await DatabaseService().isUserDocExists()) {
                      setState(() {
                        _showFormDialogBox();
                      });
                    }
                  },
                  child: Container(
                    width: screenWidth,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Image.asset(
                              "assets/images/google.png",
                              width: 30,
                              height: 30,
                            )),
                        Center(
                            child: Text("Sign-in with google",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        ),
      ),
    );
  }

  void _showFormDialogBox() {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    Dialog dialog = Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.only(bottom: 50, right: 15),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
                height: screenHeight * 0.7,
                width: screenWidth * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Form(
                    child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                          child: Text("Let's get bit familiar :)",
                              style: headingStyle)),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: "Username"),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            InputDecoration(hintText: "example@gmail.com"),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(hintText: "Age"),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),
                      TextField(
                        keyboardType: TextInputType.text,
                        decoration:
                            InputDecoration(hintText: "Male/Female/Other"),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: screenWidth,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(500),
                          color: Color(0XFFA27445),
                          // gradient: LinearGradient(
                          //     begin: Alignment.centerLeft,
                          //     end: Alignment.centerRight,
                          //     colors: [
                          //       Color(0XFFA27445),
                          //       Color(0XFFF3DFCA),
                          //       Color(0XFFA27445)
                          //     ])
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text("Submit",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                )))));
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
