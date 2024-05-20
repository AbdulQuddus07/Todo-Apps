import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DataBaseServices {
  static Future<void> addDataFirebase(String title, String details) async {
   firebaseFirestore
        .collection("Batch-11")
        .add({"title": title, "details": details})
        .whenComplete(() => print("successfully added new data"))
        .catchError((e) => e);
  }

  static Future<void> delete(String id) async {
    await firebaseFirestore.collection("Batch-11").doc(id).delete();
  }

  static Future<void> update(String id, String title, String details) async {
    await firebaseFirestore
        .collection("Batch-11")
        .doc(id)
        .update({"title": title, "details": details}).whenComplete(() => print("successfully updated data"))
        .catchError((e) => e);
  }
}
