import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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

    print(screenWidth);

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
          EdgeInsets.only(top: screenHeight * 0.1, bottom: screenHeight * 0.2),
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

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.edit_rounded,
                            color: Colors.brown[900],
                            size: 15,
                          ),
                          onPressed: () {
                            DatabaseService().uploadImageToStorage();
                          })
                    ],
                  ),
                  Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 10,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ]),
                      child: Image.network(url.toString()),
                    ),
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
                ],
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
