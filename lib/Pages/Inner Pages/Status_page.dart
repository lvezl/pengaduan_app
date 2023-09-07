import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tiket")),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Add Data",
                style: TextStyle(fontSize: 28),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "label",
                    hintText: "honted",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.grey)),
                  ),
                ),
              ],
            )),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(onPressed: () {}, child: Text("Save"))
          ],
        ),
      )),
    );
  }
}
