import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:moodbuster/database/database.dart';
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
        backgroundColor: Color(0XFFfff2e3),
        body: Container(
          margin: EdgeInsets.only(top: 100, right: 30, left: 30, bottom: 10),
          child: StreamBuilder<Object>(
              stream: DatabaseService().fetchBlog(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> blogs = querySnapshot.docs;
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 2,
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: blogs.length,
                      itemBuilder: (context, index) {
                        return blogCard(
                            blogs[index].data()['title'],
                            blogs[index].data()['pictureUrl'],
                            blogs[index].data());
                      });
                } else {
                  return Center(child: Text("Loading..."));
                }
              }),
        ));
  }

  Widget blogCard(String title, String imageUrl, Map blogData) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300,
          width: 500,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              "$imageUrl",
              fit: BoxFit.cover,
              filterQuality: FilterQuality.medium,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlogScreen(
                          blogData: blogData,
                        )));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: 100,
            width: 300,
            color: Colors.white.withOpacity(0.7),
            child: Center(
              child: Text("$title",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18)),
            ),
          ),
        ),
      ],
    );
  }
}
