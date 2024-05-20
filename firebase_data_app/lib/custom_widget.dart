import 'package:flutter/material.dart';

class TextFieldWidgets {
  static textField(
      TextEditingController controller, String label, BuildContext context) {
    return TextFormField(
      validator: (v) {
        if (v!.isEmpty) {
          return "write text here";
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
              fontSize: 20,
              color: Theme.of(context).colorScheme.inversePrimary),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 31, 120, 192)),
              borderRadius: BorderRadius.all(Radius.circular(15)))),
    );
  }

  static cusButton(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white)),
      child: Center(
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                "CLOSE",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ))),
    );
  }
}
