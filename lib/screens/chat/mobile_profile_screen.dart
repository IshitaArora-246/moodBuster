import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hovering/hovering.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/screens/dashboard.dart';

class MobProfile extends StatefulWidget {
  @override
  _MobProfileState createState() => _MobProfileState();
}

class _MobProfileState extends State<MobProfile> {
  Map userDoc;
  Uri url;

  @override
  void initState() {
    super.initState();
  }

  Future<int> setDoc() async {
    userDoc = await DatabaseService().getDoc();
    if (userDoc['photo_url'] == null || userDoc['photo_url'] == "")
      url = null;
    else
      url = await DatabaseService().downloadUrl(userDoc['photo_url']);

    return Future.value(1);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: lightskin,
        body: Container(
            margin: EdgeInsets.symmetric(
                vertical: screenHeight * 0.11, horizontal: screenWidth * 0.17),
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
                  ],
                ),
                FutureBuilder<Object>(
                    future: setDoc(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Container(
                          child: Center(
                            child: SpinKitCircle(
                              color: Colors.brown,
                              size: 70.0,
                            ),
                          ),
                        );
                      }

                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Spacer(),
                                Center(
                                  child: url == null
                                      ? Icon(
                                          Icons.person_outlined,
                                          size: 50,
                                        )
                                      : CircleAvatar(
                                          backgroundColor: Colors.black,
                                          backgroundImage:
                                              NetworkImage(url.toString()),
                                          radius: 75,
                                        ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    DatabaseService().uploadImageToStorage();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0XFFC19A6B)
                                                  .withOpacity(0.9),
                                              Color(0XFFC19A6B).withOpacity(0.8)
                                            ]),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Center(
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        color: Colors.brown[900],
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${userDoc['username']}",
                                  style: paraStyle.copyWith(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fieldData("Age: ", "${userDoc['age']}"),
                                fieldData("Gender: ", "${userDoc['gender']}"),
                                fieldData("City: ", "${userDoc['city']}"),
                                fieldData("State: ", "${userDoc['State']}")
                              ],
                            ),
                            Center(
                              child: HoverButton(
                                onpressed: () async {
                                  setState(() {});
                                },
                                child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: tan.withOpacity(0.4),
                                        border: Border.all(
                                          color: tan.withOpacity(0.4),
                                          width: 2,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Center(
                                      child: Text("Refresh",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                    )),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ))));
  }

  Widget fieldData(String key, String value) {
    return Column(
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: key,
              style: paraStyle.copyWith(
                  fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          TextSpan(text: value, style: paraStyle),
        ])),
        SizedBox(height: 20),
      ],
    );
  }
}
