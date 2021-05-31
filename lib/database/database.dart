// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/firebase.dart' as fb;

class DatabaseService {
  final String uid;
  FirebaseAuth auth;
  DatabaseService({this.uid}) {
    auth = FirebaseAuth.instance;
  }

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference blogCollection =
      FirebaseFirestore.instance.collection("blogs");
  final CollectionReference chatCollection =
      FirebaseFirestore.instance.collection("chats");
  final CollectionReference expertCollection =
      FirebaseFirestore.instance.collection("expert");

  Future<Map<String, dynamic>> getUserDoc() async {
    User user = auth.currentUser;
    final id = user.uid;
    final doc = await userCollection.doc(id).get();
    return doc.data();
  }

  Future<bool> isUserDocExists() async {
    User user = auth.currentUser;
    DocumentSnapshot userDoc = await userCollection.doc(user.uid).get();
    print(user.uid);
    if (userDoc.exists) {
      return true;
    }
    return false;
  }

  Future<void> upoadBlog({@required Map blogData}) async {
    blogCollection.add(blogData);
    print("Blog successfully added to Database");
  }

  Future<void> getInTouchWithExpert({@required Map feedback}) async {
    expertCollection.add(feedback);
    print("feedback successfully added to Database");
  }

  Future<void> saveUserData({@required Map userData}) async {
    User user = auth.currentUser;
    userCollection.doc(user.uid).set(userData);
    print("User Successfully added to Database");
  }

  Stream<QuerySnapshot> fetchBlog() {
    return FirebaseFirestore.instance.collection("blogs").snapshots();
  }

  Stream<QuerySnapshot> getChats() {
    return FirebaseFirestore.instance
        .collection("chats")
        .orderBy("createdAt", descending: true)
        .snapshots();
  }

  Future<void> deleteChats() {
    User user = auth.currentUser;

    return FirebaseFirestore.instance
        .collection("chats")
        .doc(user.uid)
        .delete();
  }

  Stream userStream() {
    return userCollection.doc("JIYiNKwtF5bGefNYeuYvLSGrpDi2").snapshots();
  }

  Future<Uri> downloadUrl(String photoPath) async {
    var reference = fb
        .storage()
        .refFromURL('gs://mood-buster-app.appspot.com/')
        .child(photoPath);
    final dpUrl = await reference.getDownloadURL();
    return dpUrl;
  }

// To open file dialog box  in order to select image
  void uploadImage({@required Function(File file) onSelected}) {
    InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoad.listen((event) {
        onSelected(file);
        print("Picture selected which is to be uploaded in firebase");
      });
    });
  }

//image is uploaded to firebase storage
  void uploadImageToStorage() {
    User user = auth.currentUser;
    // final dateTime = DateTime.now();
    final userId = user.uid;
    final path = '$userId/dp-$userId';

    uploadImage(onSelected: (file) {
      fb
          .storage()
          .refFromURL('gs://mood-buster-app.appspot.com/')
          .child(path)
          .put(file)
          .future
          .then((_) {
        userCollection.doc(user.uid).update({'photo_url': path});
        return Future.value(1);
      });
    });
    print("Profile picture updated in firebase and shown to user");
  }

  Future<Map<String, dynamic>> getDoc() async {
    User user = auth.currentUser;
    DocumentSnapshot doc = await userCollection.doc(user.uid).get();
    return doc.data();
  }

  Future<String> getName() async {
    User user = auth.currentUser;
    DocumentSnapshot doc = await userCollection.doc(user.uid).get();
    return doc.data()["username"];
  }

  Future<String> getPhotoUrl() async {
    User user = auth.currentUser;
    DocumentSnapshot doc = await userCollection.doc(user.uid).get();
    print("----------------${doc.data()["photo_url"]}");
    return doc.data()["photo_url"];
  }

  Future<String> getEmail() async {
    User user = auth.currentUser;
    DocumentSnapshot doc = await userCollection.doc(user.uid).get();

    return doc.data()["email"];
  }

  sendMessage(String name, String text, String uid) {
    print(name);
    Map<String, dynamic> message = {
      "name": name,
      "text": text,
      "uid": uid,
      "createdAt": DateTime.now().millisecondsSinceEpoch
    };
    chatCollection.add(message);
    print("Message: $message");
  }

  temporory() async {
    DocumentSnapshot doc = await userCollection.doc('DOCID1').get();
    print(doc.data()['name']);
  }
}
