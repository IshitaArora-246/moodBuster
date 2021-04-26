import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/screens/dashboard.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key key, @required this.blogData}) : super(key: key);
  final Map blogData;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: lightskin,
      body: Container(
        margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.05, horizontal: screenWidth * 0.17),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DashBoard()));
                      }),
                  Text("Back to Home Page"),
                  Spacer(),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
              Text(blogData['title'],
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: headingStyle.copyWith(fontSize: 50)),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Image.network(
                  blogData['pictureUrl'],
                  // width: screenWidth * 0.8,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(blogData['content'],
                  style: paraStyle, textAlign: TextAlign.justify),
              SizedBox(
                height: 20,
              ),
              Text(
                "Reference: ${blogData['reference']}",
                style: TextStyle(
                    letterSpacing: 2, fontSize: 14, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
