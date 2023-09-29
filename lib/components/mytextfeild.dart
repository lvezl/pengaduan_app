import 'package:flutter/material.dart';

class MytextField extends StatelessWidget {
  final labledtext, hintedtext;
  final TextEditingController mycontroller;
  const MytextField(
      {required this.labledtext,
      required this.hintedtext,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return "the $labledtext is required ";
        }
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: labledtext,
        hintText: hintedtext,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.black)),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.red)),
      ),
    );
  }
}
