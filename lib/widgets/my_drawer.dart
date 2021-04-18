import 'package:flutter/material.dart';
import 'package:moodbuster/widgets/nav_item.dart';

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
            ...navItems.map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                  child: NavItem(
                    name: e['name'],
                    onTap: e['onTap'],
                  ),
                )),
          ],
        ));
  }
}
