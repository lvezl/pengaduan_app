import 'package:flutter/material.dart';

class Tiket extends StatefulWidget {
  const Tiket({super.key});

  @override
  State<Tiket> createState() => _TiketState();
}

class _TiketState extends State<Tiket> {
  List<String> paketlayanan = ["INDIBIS", "ASTINET", "WMS", "SPGDT 119"];
  String _paketlayanan = "INDIBIS";

  TextEditingController controllerNama = TextEditingController();
  TextEditingController controllerOPD = TextEditingController();
  TextEditingController controllerOTP = TextEditingController();
  TextEditingController controllerKeluhan = TextEditingController();

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
              "Nama Lengkap : ${controllerNama.text}",
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
              "Nama OPD : ${controllerOPD.text}",
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
              "Nomor OTP : ${controllerOTP.text}",
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
              "Keluhan : ${controllerKeluhan.text}",
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
      appBar: AppBar(
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text(
          "Tiket Pengaduan",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
      ),
      //Form Tiketing
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: controllerNama,
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
                  controller: controllerOPD,
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
                  controller: controllerOTP,
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
                  controller: controllerKeluhan,
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
                  onTap: () {
                    kirimdata();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Kirim",
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
        ],
      ),
    );
  }
}
