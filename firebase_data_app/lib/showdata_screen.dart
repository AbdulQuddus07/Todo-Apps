import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_data_app/adddata_screen.dart';
import 'package:firebase_data_app/editdata_screen.dart';
import 'package:flutter/material.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class ShowDataScreen extends StatelessWidget {
  const ShowDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: firebaseFirestore.collection("Batch-11").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    final resData = snapshot.data!.docs[index];
                    return Dismissible(
                      background: Container(
                        color: Colors.red,
                      ),
                      key: UniqueKey(),
                      onDismissed: (v) {
                       
                      },
                      child: Card(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          child: ExpansionTile(
                            leading: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                         builder: (context) => EditDataScreen(
                                               id: resData.id,
                                               title: resData["title"],
                                                details: resData["details"],
                                              )));
                                },
                                child: const Icon(Icons.edit)),
                            title: Text("${resData["title"]}"),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("${resData["details"]}"),
                              )
                            ],
                          )),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () async {
          //addData();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddDataScreen();
          }));
        },
        child: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
