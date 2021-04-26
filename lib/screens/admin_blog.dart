import 'package:flutter/material.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';

class UploadBlogPage extends StatelessWidget {
  const UploadBlogPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController refController = TextEditingController();
    TextEditingController photoController = TextEditingController();

    return Scaffold(
      backgroundColor: lightskin,
      body: Container(
          margin: EdgeInsets.all(100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title\n"),
              buildTextbox(4, titleController),
              SizedBox(height: 10),
              Text("PictureUrl\n"),
              buildTextbox(1, photoController),
              SizedBox(height: 10),
              Text("Content\n"),
              buildTextbox(400, contentController),
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
                    DatabaseService().upoadBlog(blogData: blogData);
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
