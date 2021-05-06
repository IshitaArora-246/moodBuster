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
  Map userDoc = {};

  @override
  void initState() {
    super.initState();
    setDoc();
  }

  Future<Map<String, dynamic>> setDoc() async {
    userDoc = await DatabaseService().getDoc();
    print("# # # Profile init: $userDoc");
    return userDoc;
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
      color: Colors.green[50],
      padding:
          EdgeInsets.only(top: screenHeight * 0.1, bottom: screenHeight * 0.1),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
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
            FutureBuilder<String>(
                future: DatabaseService().getPhotoUrl(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Container(
                      child: Center(
                        child: SpinKitCircle(
                          color: Colors.brown,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  // print(snapshot.data.toString());
                  return Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Image.network(snapshot.data),
                      minRadius: 70,
                      maxRadius: 90,
                    ),
                  );
                }),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${userDoc['name']}",
                  // style: paraStyle.copyWith(
                  //     fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 25),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Age: 19"),
                SizedBox(height: 20),
                Text("Gender: Male"),
                SizedBox(height: 20),
                Text("Email: Example@gmail.com"),
                SizedBox(height: 20),
                Text("Address: City, State")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
