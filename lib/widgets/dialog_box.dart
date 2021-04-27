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
  PageController pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  TextEditingController ageController = TextEditingController();
  TextEditingController genderCOntroller = TextEditingController();
  bool isLoading = false;
  String error = "";

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Dialog(
      backgroundColor: Colors.white,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Stack(
          alignment: Alignment.center,
          children: [
            IgnorePointer(
              ignoring: isLoading,
              child: Opacity(
                opacity: isLoading ? 0.5 : 1,
                child: Container(
                  height: screenHeight * 0.9,
                  width: screenWidth * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      screenWidth < 700
                          ? Container()
                          : Expanded(
                              child: Container(
                                height: screenHeight * 0.6,
                                padding: EdgeInsets.all(20),
                                child: Image.asset(
                                  "assets/images/dialog.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                      Expanded(
                        child: PageView(
                          controller: pageController,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Form(
                                child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 30),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Spacer(),
                                        IconButton(
                                            icon: Icon(Icons.close),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            }),
                                      ],
                                    ),
                                    SizedBox(height: 35),
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
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0XFFA6DAE8),
                                              width: 2),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0XFFA6DAE8),
                                              width: 2),
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
                                        borderRadius:
                                            BorderRadius.circular(500),
                                        color: Color(0XFFA27445),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          pageController.animateToPage(1,
                                              duration:
                                                  Duration(milliseconds: 600),
                                              curve: Curves.easeInOut);
                                        },
                                        child: Text("Login",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white)),
                                      ),
                                    ),
                                    Row(children: <Widget>[
                                      Expanded(
                                        child: Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0, right: 15.0),
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
                                            margin: const EdgeInsets.only(
                                                left: 15.0, right: 10.0),
                                            child: Divider(
                                              color: Colors.grey,
                                              height: 50,
                                            )),
                                      ),
                                    ]),
                                    InkWell(
                                      onTap: () async {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        await context
                                            .read<FirebaseAuthService>()
                                            .signInWithGoogle();
                                        bool docExist = await DatabaseService()
                                            .isUserDocExists();
                                        setState(() {
                                          isLoading = false;
                                          docExist
                                              ? Navigator.pop(context)
                                              : pageController.animateToPage(1,
                                                  duration: Duration(
                                                      milliseconds: 600),
                                                  curve: Curves.easeInOut);
                                        });
                                      },
                                      child: Container(
                                        width: screenWidth,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border.all(
                                                width: 1, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8),
                                                child: Image.asset(
                                                  "assets/images/google.png",
                                                  width: 30,
                                                  height: 30,
                                                )),
                                            Center(
                                                child: Text(
                                                    "Sign-in with google",
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Colors.black))),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )),
                            Container(
                                height: screenHeight * 0.7,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 30),
                                  child: Form(
                                    key: _formKey,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Center(
                                              child: Text(
                                                  "Let's get a bit familiar :)",
                                                  style: headingStyle)),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty ||
                                                  value.length > 6) {
                                                return "Length of username should be more than 6 characters";
                                              }
                                              return null;
                                            },
                                            controller: usernameController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: "Username",
                                              errorStyle: TextStyle(
                                                color: Colors.red[400],
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Invalid entry";
                                              }
                                              return null;
                                            },
                                            controller: ageController,
                                            decoration: InputDecoration(
                                              hintText: "Age",
                                              errorStyle: TextStyle(
                                                color: Colors.red[400],
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ],
                                            keyboardType: TextInputType.number,
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            // validator: (value) {
                                            //   if (value != "Male" ||
                                            //       value != "Female" ||
                                            //       value != "Other") {
                                            //     return "Inavlid entryyy";
                                            //   }
                                            //   return null;
                                            // },
                                            controller: genderCOntroller,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                errorStyle: TextStyle(
                                                  color: Colors.red[400],
                                                  fontSize: 15.0,
                                                ),
                                                hintText: "Male/Female/Other"),
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Invalid entry";
                                              }
                                              return null;
                                            },
                                            controller: cityController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: "City/Town",
                                              errorStyle: TextStyle(
                                                color: Colors.red[400],
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          TextFormField(
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "Invalid entry";
                                              }
                                              return null;
                                            },
                                            controller: stateController,
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                              hintText: "State",
                                              errorStyle: TextStyle(
                                                color: Colors.red[400],
                                                fontSize: 15.0,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 35),
                                          Container(
                                            width: screenWidth,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(500),
                                              color: Color(0XFFA27445),
                                            ),
                                            child: TextButton(
                                              onPressed: () {
                                                Map<String, dynamic> userData =
                                                    {
                                                  "username":
                                                      usernameController.text,
                                                  "age": ageController.text,
                                                  "gender":
                                                      genderCOntroller.text,
                                                  "city": cityController.text,
                                                  "State": stateController.text,
                                                  "createdAt": DateTime.now()
                                                      .millisecondsSinceEpoch,
                                                };

                                                setState(() {
                                                  if (_formKey.currentState
                                                      .validate()) {
                                                    DatabaseService()
                                                        .saveUserData(
                                                            userData: userData);
                                                    Navigator.pop(context);
                                                    print(error);
                                                  }
                                                  return null;
                                                });
                                              },
                                              child: Text("Submit",
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            isLoading ? CircularProgressIndicator() : SizedBox()
          ],
        ),
      ),
    );
  }
}
