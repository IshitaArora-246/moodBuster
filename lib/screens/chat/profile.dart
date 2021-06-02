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
    print('@@@@@@@@@ setDoc');
    userDoc = await DatabaseService().getDoc();
    print('@@@@@@@@@ userDoc');
    if (userDoc['photo_url'] == null || userDoc['photo_url'] == "")
      url = null;
    else
      url = await DatabaseService().downloadUrl(userDoc['photo_url']);
    print('@@@@@@@@@ ho gya download');

    return Future.value(1);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var _currentUser = Provider.of<UserModel>(context);

    if (_currentUser.uid == null) return Container();
    print("@@@@@@@@@ ${_currentUser.uid}");
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
                                  backgroundImage: NetworkImage(url.toString()),
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
                                      Color(0XFFC19A6B).withOpacity(0.9),
                                      Color(0XFFC19A6B).withOpacity(0.8)
                                    ]),
                                borderRadius: BorderRadius.circular(3)),
                            child: Center(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                color: Colors.brown[900],
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ],

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
