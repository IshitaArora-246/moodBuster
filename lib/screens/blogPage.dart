import 'package:flutter/material.dart';
import 'package:moodbuster/shared/navbar.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [NavBar(), Center(child: Text("This is Blog page"))],
      )),
    );
  }
}
