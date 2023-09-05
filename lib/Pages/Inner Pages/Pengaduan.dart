import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pengaduan_app/Pages/Home_pages.dart';

class Tiket extends StatefulWidget {
  const Tiket({super.key});

  @override
  State<Tiket> createState() => _TiketState();
}

class _TiketState extends State<Tiket> {
  List<String> paketlayanan = ["INDIBIS", "ASTINET", "WMS", "SPGDT 119"];
  String _paketlayanan = "INDIBIS";

  final _namaController = TextEditingController();
  final _opdController = TextEditingController();
  final _otpController = TextEditingController();
  final _keluhanController = TextEditingController();

  Future keluhanDetails() async {
    final CollectionReference _Tiket =
        FirebaseFirestore.instance.collection('pengaduan');
  }

  void pilihpaketlayanan(String? value) {
    setState(() {
      _paketlayanan = value!;
    });
  }

  void kirimdata() {
    //Pop Up Pemberiatahuan
    AlertDialog alertDialog = AlertDialog(
      content: Container(
        height: 500.0,
        width: 500.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
            ),
            Text(
              "Nama Lengkap : ${_namaController.text}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              "Nama OPD : ${_opdController.text}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              "Paket Layanan : $_paketlayanan",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              "Nomor OTP : ${_otpController.text}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              "Keluhan : ${_keluhanController.text}",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 100.0),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tiket()),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tiket()),
              ),
              child: Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "Batal",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }

  //Appbar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDDADA),
      appBar: AppBar(
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
        title: Text(
          "Tiket Pengaduan",
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
      ),
      //Form Tiketing
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _namaController,
                  decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  controller: _opdController,
                  decoration: InputDecoration(
                      hintText: "Nama OPD",
                      labelText: "Nama OPD",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Row(
                  children: [
                    Text(
                      "  Paket Layanan :  ",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: _paketlayanan,
                      items: paketlayanan.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        pilihpaketlayanan(value);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  controller: _otpController,
                  decoration: InputDecoration(
                      hintText: "Nomor OTP",
                      labelText: "Nomor OTP",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                TextField(
                  controller: _keluhanController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      hintText: "Keluhan",
                      labelText: "Keluhan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0))),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                GestureDetector(
                  onTap: keluhanDetails,
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text(
                        "Kirim",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
