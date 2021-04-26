import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';

class NavItem extends StatelessWidget {
  final String name;
  final Function onTap;
  const NavItem({
    Key key,
    @required this.name,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
            onTap: onTap,
            child: Container(
                child: Text(
              name,
              style: paraStyle,
            ))));
  }
}
