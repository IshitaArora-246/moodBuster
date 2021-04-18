import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodbuster/screens/dashboard.dart';
import 'package:moodbuster/widgets/nav_item.dart';

class NavBar extends StatefulWidget {
  NavBar({
    Key key,
    @required this.parent,
  }) : super(key: key);
  final DashBoardState parent;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List navItems;
  Color tan = Color(0XFFC19A6B);

  @override
  void initState() {
    super.initState();
    navItems = [
      {
        'name': 'Home',
        'onTap': () {
          widget.parent.setState(() {
            widget.parent.currentPage = 'home';
          });
        },
      },
      {
        'name': 'Articles',
        'onTap': () {
          widget.parent.setState(() {
            widget.parent.currentPage = 'articles';
          });
        },
      },
      {
        'name': 'Movies/Series',
        'onTap': () {
          widget.parent.setState(() {
            widget.parent.currentPage = 'suggestion';
          });
        },
      },
      {
        'name': 'Chat Forum',
        'onTap': () {
          widget.parent.setState(() {
            widget.parent.currentPage = 'chat';
          });
        },
      },
      {
        'name': 'About Us',
        'onTap': () {
          widget.parent.setState(() {
            widget.parent.currentPage = 'about';
          });
        },
      },
    ];
  }

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
                screenWidth < 815
                    ? Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () {
                                  Scaffold.of(context).openEndDrawer();
                                }),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Row(
                          children: [
                            ...navItems.map((e) => NavItem(
                                  name: e['name'],
                                  onTap: e['onTap'],
                                )),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                print("Login Button tapped!");
                                _showMenuDialog(context);
                              },
                              child: Container(
                                width: 130,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: tan,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text("Login/Sign-up",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            letterSpacing: 1.05,
                                            fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ));
  }

  void _showMenuDialog(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    Dialog dialog = Dialog(
      insetPadding: EdgeInsets.only(bottom: 50, right: 15),
      child: Center(
        child: Container(
          height: screenHeight * 0.7,
          width: screenWidth * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.9),
          ),
          child: Form(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Row(
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
                        borderSide:
                            BorderSide(width: 2, color: Colors.grey.shade400)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 2,
                      color: tan.withOpacity(0.5),
                    )),
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.grey.shade700,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  style: TextStyle(fontWeight: FontWeight.w500),
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.grey.shade400)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      width: 2,
                      color: tan.withOpacity(0.5),
                    )),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade500,
                    ),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey.shade700,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: screenWidth,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.green,
                  ),
                  child: TextButton(
                    onPressed: () {},
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
                  onTap: () {},
                  child: Container(
                    width: screenWidth,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.grey[500]),
                        borderRadius: BorderRadius.circular(4)),
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
                                style: TextStyle(fontSize: 20))),
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
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
