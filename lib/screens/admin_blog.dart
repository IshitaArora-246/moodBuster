import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController refController = TextEditingController();
    TextEditingController photoController = TextEditingController();

    return Scaffold(
      body: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title\n"),
              buildTextbox(2, titleController),
              SizedBox(height: 10),
              Text("PictureUrl\n"),
              buildTextbox(1, photoController),
              SizedBox(height: 10),
              Text("Content\n"),
              buildTextbox(50, contentController),
              SizedBox(height: 10),
              Text("Reference\n"),
              buildTextbox(2, refController),
              TextButton(
                  onPressed: () {
                    Map<String, dynamic> blogData = {
                      "title": titleController.text,
                      "pictureUrl": photoController.text,
                      "content": contentController.text,
                      "reference": refController.text,
                      "date": DateTime.now().millisecondsSinceEpoch,
                    };
                    FirebaseFirestore.instance
                        .collection("blogs")
                        .add(blogData);
                    print("Successfully added to Database");
                  },
                  child: Text("Submit"))
            ],
          )),
    );
  }

  Expanded buildTextbox(int myMaxlines, TextEditingController myController) {
    return Expanded(
      child: TextField(
        controller: myController,
        maxLines: myMaxlines,
        decoration: InputDecoration(
            fillColor: Colors.blue,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 2, color: Colors.blue[800]))),
      ),
    );
  }
}
