import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    TextEditingController namecontroller = TextEditingController();
    TextEditingController feedbackController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0XFFfff2e3),
      body: Container(
          margin: EdgeInsets.only(
              top: screenHeight * 0.12,
              left: screenWidth * 0.17,
              right: screenWidth * 0.17,
              bottom: screenHeight * 0.1),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "GET IN TOUCH",
                    style: headingStyle.copyWith(
                        fontSize: 45, wordSpacing: 2, letterSpacing: 1.5),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildTextbox(1, namecontroller, "Your name", formKey),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildTextbox(1, emailController, "Your email", formKey),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      buildTextbox(10, feedbackController,
                          "Tell us about your experience", formKey),
                    ],
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () async {
                      Map<String, dynamic> feedback = {
                        "name": namecontroller.text,
                        "email": emailController.text,
                        "feedback": feedbackController.text,
                        "date": DateTime.now().millisecondsSinceEpoch,
                      };
                      emailController.text = await DatabaseService().getEmail();

                      print(feedback);

                      if (formKey.currentState.validate()) {
                        DatabaseService()
                            .getInTouchWithExpert(feedback: feedback);
                      }
                      setState(() {});
                    },
                    child: Container(
                        width: 200,
                        height: 60,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: tan.withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 10)
                        ], color: tan, borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text("Submit",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        )),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Expanded buildTextbox(int myMaxlines, TextEditingController myController,
      String hint, Key formKey) {
    return Expanded(
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) return "Empty Fields are not allowed";
          return null;
        },
        controller: myController,
        maxLines: myMaxlines,
        decoration: InputDecoration(
          hintText: hint,
          fillColor: tan,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(width: 2, color: tan)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: tan)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tan.withOpacity(0.6))),
        ),
      ),
    );
  }
}
