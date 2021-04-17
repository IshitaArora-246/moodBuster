import 'package:flutter/material.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Stack(
        children: [Center(child: Text("This is Blog page"))],
      )),
    );
  }
}
