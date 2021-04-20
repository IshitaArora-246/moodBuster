import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/screens/dashboard.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            vertical: screenHeight * 0.05, horizontal: screenWidth * 0.17),
        // padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.15),
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
              Text("How to cope with anger issues?",
                  maxLines: 3,
                  textAlign: TextAlign.left,
                  style: headingStyle.copyWith(fontSize: 50)),
              Text(
                "-BY SARAH STEELE",
                style: TextStyle(
                    letterSpacing: 2, fontSize: 18, color: Colors.grey[700]),
              ),
              Divider(
                height: 20,
                thickness: 3,
              ),
              Text(
                  "Amet gubergren elitr sit amet dolor et tempor consetetur. Sed clita sit aliquyam sanctus accusam elitr sadipscing, ea dolor gubergren sit ipsum lorem. Eos kasd accusam sadipscing sit aliquyam et eos. Sed invidunt diam gubergren duo at et diam consetetur ea. Sea consetetur diam invidunt dolor, lorem dolor dolor dolor at lorem. Ea sea rebum consetetur dolor sit. Sit est sit nonumy kasd dolores. Sed ea at diam lorem sit clita. Lorem eirmod diam vero et stet lorem duo accusam, consetetur et aliquyam clita duo ut at, takimata sadipscing lorem et et justo amet. Duo invidunt dolor at lorem sed amet et, eos lorem eirmod consetetur clita. Diam invidunt diam takimata duo elitr, et ipsum dolores et voluptua, diam diam eos invidunt nonumy est magna aliquyam, voluptua ipsum magna et clita justo clita gubergren sadipscing. Ut kasd eirmod dolore sit, et et sadipscing justo justo voluptua duo gubergren, sea ipsum dolor labore tempor vero magna amet invidunt diam. At consetetur magna et accusam at, invidunt sed sit sea eos diam sit consetetur et eirmod. Est aliquyam rebum elitr et no ut et, dolor at at duo et justo amet dolores sed. Dolor erat amet justo clita dolore diam duo takimata invidunt, dolores vero eirmod eirmod diam. Dolor kasd et lorem kasd sadipscing consetetur lorem at, rebum labore ea diam no nonumy sit ut ea stet. Aliquyam amet lorem justo accusam gubergren lorem, no dolor stet eirmod aliquyam eos. Rebum accusam voluptua consetetur justo magna et magna amet. At diam ipsum lorem nonumy sit nonumy et. Ipsum sed et rebum ea accusam dolore duo. Duo erat clita et no ea. No sed dolor justo ut, ipsum at consetetur accusam sea justo erat. Voluptua duo sit kasd diam. Dolore sanctus justo justo dolor sanctus, eirmod accusam sit dolore sea.\n\nNo sit eos accusam consetetur et justo, sanctus eos sea justo ut, no dolore et accusam justo lorem duo. Eirmod duo dolor sea dolores, nonumy gubergren erat ipsum dolores. Vero vero eos tempor ipsum et dolore. Tempor duo dolores invidunt elitr sit amet lorem tempor. Sadipscing consetetur justo ipsum amet labore, lorem duo sed dolores elitr, tempor et tempor sed et. Aliquyam aliquyam nonumy tempor lorem dolores sit justo dolores dolor. Accusam gubergren amet et dolor amet at. Dolore sed et invidunt nonumy magna tempor. Kasd diam sed voluptua diam sadipscing sed, sea ipsum diam diam lorem stet amet, ipsum vero sea lorem vero diam sed dolor lorem ipsum, nonumy et clita et lorem amet sit sed ea. Erat voluptua voluptua ipsum magna amet gubergren eos kasd, ipsum est lorem erat nonumy aliquyam clita dolor lorem. No gubergren magna rebum sanctus et et lorem tempor, ipsum lorem ut dolor et ut, rebum clita takimata diam amet et ipsum. Amet dolor dolor sit et. Stet amet invidunt ea dolor vero. Dolor vero takimata sanctus duo dolor. Dolor dolores amet sed et invidunt dolores et. Sed invidunt voluptua et lorem sed et, ut amet amet et takimata eirmod labore sed tempor lorem. Consetetur diam duo dolor clita amet ipsum at lorem, at labore et dolore lorem nonumy et. No at gubergren vero eos dolores magna tempor. Stet sit justo et et voluptua et dolores dolore. Nonumy ipsum sit dolore diam no, amet consetetur erat sea dolor sed no dolor, sed tempor stet erat ipsum et tempor, ut rebum dolore duo ut labore duo diam ipsum. Amet rebum stet duo eirmod sit duo erat et.\n\net et gubergren ut ut accusam dolores, invidunt consetetur diam at dolor at ipsum no sit ipsum, erat justo ut labore diam labore rebum rebum. No stet gubergren no et dolore ut eos, dolor amet voluptua lorem amet eos rebum. Erat est stet elitr dolore ipsum. Tempor ipsum ipsum ea tempor sadipscing sanctus eos sit. Ut aliquyam sea erat erat sit stet sit, dolor dolores clita vero ut labore ipsum, diam at lorem voluptua accusam, no ipsum lorem nonumy invidunt sanctus eirmod, diam sea et lorem et diam ut ipsum. Elitr gubergren lorem sadipscing dolor justo stet, duo invidunt invidunt aliquyam lorem.\n\nEt et voluptua lorem amet lorem eirmod. Gubergren diam lorem dolor ipsum lorem sed, ipsum et elitr dolor accusam sed elitr nonumy. Et ea no stet sanctus amet aliquyam.",
                  style: paraStyle,
                  textAlign: TextAlign.justify),
              SizedBox(
                height: 20,
              ),
              Text(
                "Reference: https://www.helpguide.org/articles/relationships-communication/anger-management.htm",
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
