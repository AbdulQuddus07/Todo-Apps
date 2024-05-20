import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_data_app/custom_widget.dart';
import 'package:firebase_data_app/database_services.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class EditDataScreen extends StatelessWidget {
final  String? title;
final   String? details;
 final  String? id;

   EditDataScreen({super.key, this.title, this.details, this.id});

  final titleC = TextEditingController();

  final detailC = TextEditingController();

  final GlobalKey<FormState> form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'UPDATE_PAGE',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidgets.textField(titleC, "$title", context),
            const SizedBox(
              height: 20,
            ),
            TextFieldWidgets.textField(detailC, "$details", context),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
              width: double.infinity,
              child: InkWell(
                  onTap: () {
                     DataBaseServices.update(id!, titleC.text, detailC.text);
                    titleC.clear();
                    detailC.clear();
                  // if (form.currentState!.validate()) {
                     
                  // }
                  
                  },
                  child: const Center(
                      child: Text(
                    ":UPDATE DATA:",
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
    );
  }
}
