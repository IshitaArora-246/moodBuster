// import 'package:moodbuster/constants/textStyle.dart';
// import 'package:moodbuster/providers/app.dart';
// import 'package:moodbuster/providers/auth.dart';

// import 'package:moodbuster/screens/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class AuthenticationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final AuthProvider authProvider = Provider.of<AuthProvider>(context);
//     final AppProvider appProvider = Provider.of<AppProvider>(context);
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body: Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(colors: [Colors.blueGrey, Colors.indigo])),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Row(
//               children: [
//                 Spacer(),
//                 IconButton(
//                     icon: Icon(Icons.close),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     })
//               ],
//             ),
//           ),
//           SizedBox(height: screenHeight * 0.13),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset("assets/images/logo.png"),
//               ),
//             ],
//           ),
//           CustomText(
//             text: "Select authentication method",
//             color: Colors.white,
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           GestureDetector(
            
//             child: Container(
//               width: 300,
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.grey.withOpacity(.3),
//                         offset: Offset(2, 3),
//                         blurRadius: 7)
//                   ]),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(
//                           width: 50,
//                           child: Image.asset("assets/images/google.png")),
//                       CustomText(text: "  Google Sign-in")
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }
