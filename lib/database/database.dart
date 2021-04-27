import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    // QuerySnapshot querySnapshot = await userCollection.get();
    DocumentSnapshot userDoc = await userCollection.doc(user.uid).get();
    print(user.uid);
    if (userDoc.exists) {
      return true;
    }
    return false;
  }

  // Future<void> createNewDocument({@required String name}) async {
  //   User user = auth.currentUser;
  //   await userCollection.doc(user.uid).set({
  //     'name': name,
  //     'createdAt': DateFormat.yMMMd().format(DateTime.now()),
  //     'phoneNumber': user.phoneNumber ?? "",
  //   });
  // }

  Future<void> upoadBlog({@required Map blogData}) async {
    blogCollection.add(blogData);
    print("Blog successfully added to Database");
  }

  Future<void> getInTouchWithExpert({@required Map feedback}) async {
    User user = auth.currentUser;

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

  Future<String> getName() async {
    User user = auth.currentUser;
    DocumentSnapshot doc = await userCollection.doc(user.uid).get();

    return doc.data()["username"];
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
