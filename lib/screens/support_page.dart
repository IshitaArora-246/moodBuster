import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key key}) : super(key: key);

  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final formKey = GlobalKey<FormState>();
    TextEditingController namecontroller = TextEditingController();
    TextEditingController feedbackController = TextEditingController();
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: lightskin,
      body: Container(
          margin: EdgeInsets.only(
            top: screenHeight * 0.12,
            left: screenWidth * 0.15,
            right: screenWidth * 0.15,
            bottom: 50,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Get in touch with experts",
                      textAlign: TextAlign.center,
                      style: headingStyle.copyWith(
                          height: 1,
                          fontSize: screenWidth > 768 ? 45 : 30,
                          wordSpacing: 2,
                          letterSpacing: 1.2),
                    ),
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
                      buildTextbox(8, feedbackController,
                          "Tell us about your experience", formKey),
                    ],
                  ),
                  SizedBox(height: 20),
                  HoverButton(
                    onpressed: () async {
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
                        decoration: BoxDecoration(
                            color: tan.withOpacity(0.4),
                            border: Border.all(
                              color: tan.withOpacity(0.4),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(50)),
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
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: tan, width: 2.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tan.withOpacity(0.6))),
        ),
      ),
    );
  }
}
