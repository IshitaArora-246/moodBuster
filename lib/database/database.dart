import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:moodbuster/models/UserModel.dart';

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

  Stream<UserModel> getUserDataStream() async* {
    await for (var firebaseUser in auth.authStateChanges()) {
      if (firebaseUser != null) {
        final id = firebaseUser.uid;
        final ref = userCollection.doc(id);
        yield* ref.snapshots().map(
          (snap) {
            if (snap.exists) {
              return UserModel(doc: snap.data(), uid: snap.id);
            } else {
              return UserModel.empty();
            }
          },
        );
      } else {
        yield UserModel.empty();
      }
    }
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

  Future<void> createNewDocument({@required String name}) async {
    User user = auth.currentUser;
    await userCollection.doc(user.uid).set({
      'name': name,
      'createdAt': DateFormat.yMMMd().format(DateTime.now()),
      'phoneNumber': user.phoneNumber ?? "",
    });
  }

  Future<void> upoadBlog({@required Map blogData}) async {
    blogCollection.add(blogData);
    print("Successfully added to Database");
  }

  temporory() async {
    DocumentSnapshot doc = await userCollection.doc('DOCID1').get();
    print(doc.data()['name']);
  }


}
