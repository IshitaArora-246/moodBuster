import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/models/UserModel.dart';
import 'package:moodbuster/screens/chat/mobile_profile_screen.dart';
import 'package:moodbuster/utils/authentication.dart';
import 'package:moodbuster/widgets/dialog_box.dart';
import 'package:moodbuster/widgets/nav_item.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
    @required this.navItems,
  }) : super(key: key);
  final navItems;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final user = Provider.of<UserModel>(context);

    return Container(
        width: screenWidth * 0.5,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0XFFC19A6B).withOpacity(0.9),
              Color(0XFFC19A6B).withOpacity(0.8)
            ])),
        child: ListView(
          children: [
            SizedBox(height: screenHeight * 0.1),
            Divider(
              endIndent: 10,
              indent: 10,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
                child: InkWell(
                    onTap: () {
                      print("Login Button tapped!");
                      if (user == null)
                        _showMenuDialog(context);
                      else
                        FirebaseAuthService().signOut();
                    },
                    child: Container(
                        child: Text(
                      user == null ? "Sign-up/Login" : "Sign-out",
                      style: paraStyle,
                    )))),
            user == null
                ? SizedBox()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 16),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MobProfile()));
                        },
                        child: Container(
                            child: Text(
                          "Profile",
                          style: paraStyle,
                        )))),
            ...navItems.map((e) {
              if (user == null && e['name'] == "Let's Talk") {
                return SizedBox();
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                child: NavItem(
                  name: e['name'],
                  onTap: e['onTap'],
                ),
              );
            }),
          ],
        ));
  }

  void _showMenuDialog(BuildContext context) {
    Widget dialog = ShowMenuDialogBox();
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }
}
