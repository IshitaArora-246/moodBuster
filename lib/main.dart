import 'package:flutter/material.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/models/UserModel.dart';
import 'package:moodbuster/screens/dashboard.dart';
import 'package:moodbuster/utils/authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    Provider(create: (_) => FirebaseAuthService()),
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
