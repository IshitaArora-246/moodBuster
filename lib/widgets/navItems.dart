import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 12.5),
      child: InkWell(
        onTap: onTap,
        child: Container(
            child: Text(name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 1.1,
                    fontWeight: FontWeight.w600))),
      ),
    );
  }
}
