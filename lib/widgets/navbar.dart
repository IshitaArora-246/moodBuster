import 'dart:ui';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/models/UserModel.dart';
import 'package:moodbuster/utils/authentication.dart';
import 'package:moodbuster/widgets/dialog_box.dart';
import 'package:provider/provider.dart';
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
        'name': 'Blogs',
        'onTap': () {
          widget.parent.setState(() {
            widget.parent.currentPage = 'blogs';
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
        'name': 'Expert Panel',
        'onTap': () {
          widget.parent.setState(() {
            widget.parent.currentPage = 'suggestion';
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
                            Consumer<UserModel>(builder: (_, user, __) {
                              return InkWell(
                                onTap: () {
                                  print("Login Button tapped!");
                                  if (user == null)
                                    _showMenuDialog(context);
                                  else
                                    FirebaseAuthService().signOut();
                                },
                                child: Container(
                                  width: 130,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: tan,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                          user == null
                                              ? "Login/Sign-up"
                                              : "Sign-out",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              letterSpacing: 1.05,
                                              fontWeight: FontWeight.bold))),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ));
  }

  void _showMenuDialog(BuildContext context) {
    Widget dialog = ShowMenuDialogBox();
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
