import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_data_app/custom_widget.dart';
import 'package:firebase_data_app/database_services.dart';
import 'package:firebase_data_app/showdata_screen.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({
    super.key,
  });

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  // addData() {
  final titleC = TextEditingController();

  final detailC = TextEditingController();

//  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Flutter-App',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidgets.textField(titleC, "Enter title here", context),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidgets.textField(
                detailC, "Enter product details", context),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
              width: double.infinity,
              child: InkWell(
                  onTap: () {
                    submit();
                    // if (form.currentState!.validate()) {
                    // DataBaseServices.addDataFirebase(titleC.text, detailC.text);
                    // // }
                    // titleC.clear();
                    // detailC.clear();
                  },
                  child: const Center(
                      child: Text(
                    ":ADD DATA:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ))),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () async {
          //addData();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ShowDataScreen();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Future<void> edialogue(String error) async {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(error),
            actions: [
              TextFieldWidgets.cusButton(
                 context
              )
            ],
          );
        });
  }

  submit() async {
    DataBaseServices.addDataFirebase(titleC.text, detailC.text);
    edialogue("Successfully Added");
    titleC.clear();
    detailC.clear();
  }
}
