import 'package:flutter/material.dart';
import 'package:pengaduan_app/Pages/Home_pages.dart';
import 'package:pengaduan_app/controllers/data_controller.dart';
import 'package:pengaduan_app/models/data_model.dart';

import '../../components/mytextfeild.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({super.key});

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  final _form_key = GlobalKey<FormState>();
  final TextEditingController nama = TextEditingController();
  final TextEditingController OPD = TextEditingController();
  final TextEditingController jenis = TextEditingController();
  final TextEditingController OTP = TextEditingController();
  final TextEditingController keluhan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDDADA),
      appBar: AppBar(
        title: Text(
          "Pengaduan",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Pengaduan",
                style: TextStyle(fontSize: 28),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                  key: _form_key,
                  child: Column(
                    children: [
                      MytextField(
                        hintedtext: "Nama",
                        labledtext: "Nama",
                        mycontroller: nama,
                      ),
                      SizedBox(height: 10),
                      MytextField(
                        hintedtext: "OPD",
                        labledtext: "OPD",
                        mycontroller: OPD,
                      ),
                      SizedBox(height: 10),
                      MytextField(
                        hintedtext: "Jenis Jaringan",
                        labledtext: "Jenis Jaringan",
                        mycontroller: jenis,
                      ),
                      SizedBox(height: 10),
                      MytextField(
                        hintedtext: "OTP",
                        labledtext: "Nomor OTP",
                        mycontroller: OTP,
                      ),
                      SizedBox(height: 10),
                      MytextField(
                        hintedtext: "Keluhan",
                        labledtext: "Keluhan",
                        mycontroller: keluhan,
                      ),
                      SizedBox(height: 10),
                    ],
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_form_key.currentState!.validate()) {
                    _form_key.currentState!.save();
                    data_controller().add_data(data_model(
                      nama: nama.text,
                      OPD: OPD.text,
                      jenis: jenis.text,
                      OTP: OTP.text,
                      keluhan: keluhan.text,
                    ));
                  }
                  Navigator.pop(context);
                },
                child: Text("Save"))
          ],
        ),
      )),
    );
  }
}
