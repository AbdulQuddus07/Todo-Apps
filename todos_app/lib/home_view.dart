import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  var textCon = TextEditingController();
  List todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'TODO',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 12.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
              child: TextField(
                controller: textCon,
                decoration:  InputDecoration(
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.blue.shade900)),
                    prefixIcon: Icon(Icons.edit,color: Colors.amber.shade900,),
                    filled: true,
                    fillColor: Colors.blue.shade100,
                     focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    hintText: 'Enter the Text',hintStyle:TextStyle(color: Colors.amber.shade900)),
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            todoList.add(textCon.text);
                            textCon.clear();
                          });
                        },
                        child: const Text('Add Task',
                            style: TextStyle(fontSize: 20.0)),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                        color: Colors.blue
                      ),
                      height: 50,
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (todoList.isNotEmpty) {
                               todoList.removeLast();
                            textCon.clear();
                            }
                          });
                        },
                        child: const Text('Remove Task',
                            style: TextStyle(fontSize: 20.0)),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  height: 50,
                  width: 420,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todoList.clear();
                      });
                    },
                    child: const Text('Clear All Task',
                        style: TextStyle(fontSize: 20.0)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              margin: EdgeInsets.only(right: 230),
              child: const Text(
                'Today Task',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    margin: const EdgeInsets.only(left: 12, right: 12),
                    padding: const EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFFF0F8FF),
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 3.0,
                              spreadRadius: 2.0),
                        ]),
                    child: Row(
                      children: [
                        const Text(
                          '• ',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          todoList[index],
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w600),
                        ),
                                                    
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context)
                  .padding
                  .bottom, // Add bottom padding to prevent overlap with the keyboard
            ),
          ],
        ),
      ),
    );
  }
}

class ToDo {
  final String text;
  ToDo({required this.text});
}
