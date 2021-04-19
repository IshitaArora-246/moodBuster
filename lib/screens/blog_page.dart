import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/screens/blog_screen.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("OUR BLOGS",
                    style: headingStyle.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 40,
                        wordSpacing: 7)),
                SizedBox(height: 20),
                blogRow(),
                SizedBox(height: 20),
                blogRow(),
                SizedBox(height: 20),
                blogRow(),
                SizedBox(height: 20),
                blogRow(),
                SizedBox(height: 20),
                blogRow(),
                SizedBox(height: 20),
                blogRow(),
                SizedBox(height: 20),
                blogRow(),
                SizedBox(height: 20),
                blogRow()
              ],
            ),
          ),
        ));
  }

  Widget blogRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [blogCard(), blogCard()],
    );
  }

  Widget blogCard() {
    return Flexible(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          width: 500,
          child: Image.network(
            "https://i0.wp.com/post.psychcentral.com/wp-content/uploads/sites/4/2021/01/Female_Window_732x549-thumbnail-732x549.jpg?w=420",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BlogScreen()));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 100,
            width: 300,
            color: Colors.white.withOpacity(0.7),
            child: Center(
              child: Text("How to Help a Loved One with Bipolar Disorder?",
                  maxLines: 3,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ],
    ));
  }
}
