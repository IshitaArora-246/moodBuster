import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/screens/blog_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BlogPage extends StatefulWidget {
  BlogPage({Key key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightskin,
        body: Container(
          margin: EdgeInsets.only(right: 30, left: 30, top: 60),
          child: Column(
            children: [
              Text(
                "Our Blogs",
                style: headingStyle.copyWith(fontSize: 30),
              ),
              Expanded(
                child: StreamBuilder<Object>(
                    stream: DatabaseService().fetchBlog(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        QuerySnapshot querySnapshot = snapshot.data;
                        List<QueryDocumentSnapshot> blogs = querySnapshot.docs;
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: blogs.length,
                            itemBuilder: (context, index) {
                              return BlogCard(
                                  context: context,
                                  title: blogs[index].data()['title'],
                                  imageUrl: blogs[index].data()['pictureUrl'],
                                  blogData: blogs[index].data());
                            });
                      } else {
                        return Container(
                          child: Center(
                            child: SpinKitCircle(
                              color: Colors.brown,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key key,
    @required this.context,
    @required this.title,
    @required this.imageUrl,
    @required this.blogData,
  }) : super(key: key);

  final BuildContext context;
  final String title;
  final String imageUrl;
  final Map blogData;

  @override
  Widget build(BuildContext context) {
    return HoverContainer(
      child: Stack(
        alignment: Alignment.center,
        children: [
          HoverContainer(
            hoverHeight: 335,
            hoverWidth: 535,
            hoverDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: tan.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10)
                ]),
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
      ),
    );
  }
}
