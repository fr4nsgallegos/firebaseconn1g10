import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  CollectionReference userReference =
      FirebaseFirestore.instance.collection("users");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        userReference.get().then((value) {
          print(value);
          QuerySnapshot userCollection = value;
          List<QueryDocumentSnapshot> docs = userCollection.docs;
          print(docs);
          print(docs.length);
          print(docs[0].id);
          docs.forEach((e) {
            print("------------------------");
            print(e);
            print(e.id);
            print(e.data());
            print("------------------------");
          });
        });
      }),
    );
  }
}
