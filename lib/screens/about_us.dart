import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          margin: EdgeInsets.symmetric(
              vertical: screenHeight * 0.13, horizontal: screenWidth * 0.17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("WHO ARE WE?", style: headingStyle),
                SizedBox(height: 20),
                Text(
                  "Mood Buster is a growing community working towards changing the way individuals think & act about problems related to Mental Health. Managed by the current generation, it’s a dedicated project to help people calm their minds & heal their lives through motivational words, graphics, podcasts, webinars, open-discussions & personal chats.\n\nHere, at Mood Buster, we want you to know You Are Not Alone. We are here to take your mind at a peaceful place, no matter what is happening around you.\n\nWe offer comprehensive content all devoted to self-improvement with a focus on personal productivity, inspiration and self-education. We offer our audience a platform to share their real-life struggles & inspiring stories that can be published & get connected with people who are affected by problems like stress, anxiety, trauma, and depression.",
                  style: paraStyle,
                ),
                SizedBox(height: 20),
                Text("OUR AIM", style: headingStyle),
                SizedBox(height: 20),
                Text(
                    "Calm Sage diverges from traditional ‘Self Help’ by taking a broader approach. Rather than sticking to a small set of topics to deal with mental illness & other issues. The platform addresses important steps you can take in the coping process & even have effective action plans for recovery. Calm Sage is a place where individuals can overcome their day-to-day challenges in a stigma-free environment. While we aspire of a progressive society & culture, we intend to impart practices where mental health taboos & issues can be discussed openly & managed effectively with emotional and professional assistance.",
                    style: paraStyle),
                SizedBox(height: 20),
                Text("OUR MISSION", style: headingStyle),
                SizedBox(height: 20),
                Text(
                    "Calm Sage strives to bring billions of smiles every day. It is our mission to improve overall mental and physical wellbeing & reduce discrimination towards individuals dealing with mental problems. We also aim to form a collaborative social structure with a sole goal to promote happiness, channel positivity, and strengthen your soul.",
                    style: paraStyle)
              ],
            ),
          )),
    );
  }
}
