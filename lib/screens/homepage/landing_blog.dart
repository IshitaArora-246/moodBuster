import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hovering/hovering.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/screens/blog_page.dart';

class LandingBlogPage extends StatelessWidget {
  const LandingBlogPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenWidth,
        color: lightskin,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Text(
              "Our Blogs",
              style: headingStyle.copyWith(
                  fontSize: 40, fontWeight: FontWeight.w800),
              maxLines: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
              child: Text(
                "There are many ways to access information and support about your mental health and wellbeing. Learn about mental health and receive information by reading our blogs",
                style: TextStyle(
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
            ),
            StreamBuilder<Object>(
                stream: DatabaseService().fetchBlog(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    QuerySnapshot querySnapshot = snapshot.data;
                    List<QueryDocumentSnapshot> blogs = querySnapshot.docs;
                    return Swiper(
                        itemCount: 5,
                        scrollDirection: Axis.horizontal,
                        autoplay: true,
                        autoplayDelay: 1700,
                        layout: SwiperLayout.TINDER,
                        itemHeight: 300,
                        itemWidth: 500,
                        itemBuilder: (context, index) {
                          return BlogCard(
                              context: context,
                              title: blogs[index].data()['title'],
                              imageUrl: blogs[index].data()['pictureUrl'],
                              blogData: blogs[index].data());
                        });
                  }
                  return SizedBox();
                }),
            SizedBox(height: 40),
            HoverButton(
              onpressed: () {},
              hoverColor: tan.withOpacity(0.5),
              child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                      color: tan.withOpacity(0.4),
                      border: Border.all(
                        color: tan.withOpacity(0.4),
                        width: 2,
                      ),
                      // boxShadow: [BoxShadow(spreadRadius: 1, blurRadius: 5)],
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
                    child: Text("View More Blogs",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  )),
            )
          ],
        ));
  }
}
