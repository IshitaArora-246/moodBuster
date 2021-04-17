import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moodbuster/shared/dashboard.dart';
import 'package:moodbuster/widgets/navItems.dart';

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
            widget.parent.currentPage = 'blog';
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
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
