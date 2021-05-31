import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/models/UserModel.dart';
import 'package:moodbuster/models/current_page.dart';
import 'package:moodbuster/screens/dashboard.dart';
import 'package:moodbuster/utils/authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    Provider(create: (_) => FirebaseAuthService()),
    ChangeNotifierProvider(create: (_) => MyPage()),
    StreamProvider(
        create: (context) =>
            context.read<FirebaseAuthService>().onAuthStateChanged,
        initialData: null)
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: lightskin,
        buttonColor: tan.withOpacity(0.5),
        fontFamily: paraFont,
        hoverColor: tan.withOpacity(0.8),
      ),
      home: Consumer<UserModel>(
        builder: (_, user, __) {
          if (user == null) {
            print("==========Not Signed in===========");
            return DashBoard();
          } else {
            DatabaseService().getUserDoc().then((value) {
              // Provider.of<UserModel>(context).doc=value;
            });
            print("===========Signed in===========");
            return DashBoard();
          }
        },
      ),
    );
  }
}
