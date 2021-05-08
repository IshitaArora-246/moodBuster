import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hovering/hovering.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/models/UserModel.dart';
import 'package:provider/provider.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({
    Key key,
  }) : super(key: key);

  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  Map userDoc;
  Uri url;

  @override
  void initState() {
    super.initState();
  }

  Future<int> setDoc() async {
    userDoc = await DatabaseService().getDoc();
    url = await DatabaseService().downloadUrl(userDoc['photo_url']);
    return Future.value(1);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var _currentUser = Provider.of<UserModel>(context);
    if (_currentUser.uid == null) return Container();

    return Container(
      height: screenHeight,
      width: screenWidth * 0.25,
      decoration: BoxDecoration(color: lightskin, boxShadow: [
        BoxShadow(
            blurRadius: 10,
            spreadRadius: 4,
            color: Colors.black.withOpacity(0.1))
      ]),
      padding:
          EdgeInsets.only(top: screenHeight * 0.1, bottom: screenHeight * 0.05),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: FutureBuilder<Object>(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            icon: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Icon(
                                Icons.edit_rounded,
                                color: Colors.brown[50],
                                size: 13,
                              ),
                            ),
                            onPressed: () {
                              DatabaseService().uploadImageToStorage();
                            })
                      ],
                    ),
                    Center(
                        child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage: NetworkImage(url.toString()),
                        radius: 75,
                      ),
                    )
                        // child: Container(
                        //   height: 150,
                        //   width: 150,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(80),
                        //       boxShadow: [
                        //         BoxShadow(
                        //             spreadRadius: 10,
                        //             blurRadius: 10,
                        //             color: Colors.black.withOpacity(0.1))
                        //       ]),
                        //   child: Image.network(url.toString()),
                        // ),
                        ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${userDoc['username']}",
                          style: paraStyle.copyWith(
                              fontSize: 28, fontWeight: FontWeight.bold),
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
                                borderRadius: BorderRadius.circular(50)),
                            child: Center(
                              child: Text("Update Profile Picture",
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
      ),
    );
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
