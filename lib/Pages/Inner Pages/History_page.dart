import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> paketlayanan = ["INDIBIS", "ASTINET", "WMS", "SPGDT 119"];
  String _paketlayanan = "INDIBIS";
  bool isLoading = true;
  final controllerId = TextEditingController();
  final controllerNama = TextEditingController();
  final controllerOPD = TextEditingController();
  final controllerOTP = TextEditingController();
  final controllerKeluhan = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  int _counter = 0;

  var datajson;
  int totalData = 0;

  void pilihpaketlayanan(String? value) {
    setState(() {
      _paketlayanan = value!;
    });
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    try {
      final response = await http.get(
        Uri.parse('http://localhost:1337/api/pengaduans'),
      );

      if (response.statusCode == 200) {
        setState(() {
          datajson = jsonDecode(response.body);
          totalData = datajson["meta"]["pagination"]["total"];
          _counter++;

          isLoading = false;
        });
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (error) {
      throw Exception('Failed to connect to the server');
    }
  }

  Future<void> addData() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response =
        await http.post(Uri.parse('http://localhost:1337/api/pengaduans'),
            headers: headers,
            body: jsonEncode({
              'data': {
                'nama': controllerNama.text,
                'opd': controllerOPD.text,
                'otp': controllerOTP.text,
                'keluhan': controllerKeluhan.text
              }
            }));

    if (response.statusCode == 200) {
      fetchData();
      controllerId.clear();
      controllerNama.clear();
      controllerOPD.clear();
      controllerOTP.clear();
      controllerKeluhan.clear();
    } else {
      throw Exception('Failed to add data');
    }
  }

  Future<void> updateData(String id) async {
    final response = await http.put(
      Uri.parse('http://localhost:1337/api/pengaduans/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'data': {
          'nama': controllerNama.text,
          'opd': controllerOPD.text,
          'otp': controllerOTP.text,
          'keluhan': controllerKeluhan.text
        }
      }),
    );

    if (response.statusCode == 200) {
      fetchData();
      controllerId.clear();
      controllerNama.clear();
      controllerOPD.clear();
      controllerOTP.clear();
      controllerKeluhan.clear();
    } else {
      throw Exception('Failed to update data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: ListView(
          children: [
            Text(
              "History",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: totalData,
                    itemBuilder: (data, index) {
                      return ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  title: Text(datajson['data'][index]
                                      ['attributes']['nama']),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          '\$ ${datajson['data'][index]['attributes']['opd']}'),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                          '${datajson['data'][index]['attributes']['otp']}'),
                                      Text(
                                          '${datajson['data'][index]['attributes']['keluhan']}'),
                                    ],
                                  ));
                            },
                          );
                        },
                        title:
                            Text(datajson['data'][index]['attributes']['Nama']),
                        subtitle: Text(
                            '\$  ${datajson['data'][index]['attributes']['opd']}'),
                        trailing: IconButton(
                          icon: Icon(Icons.shop),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(datajson['data'][index]
                                      ['attributes']['nama']),
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: 10),
                                      Text(datajson['data'][index]['attributes']
                                          ['otp']),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(datajson['data'][index]['attributes']
                                          ['keluhan']),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: controllerNama,
                                        decoration: InputDecoration(
                                          labelText: 'Nama Pengadu',
                                        ),
                                      ),
                                      TextField(
                                        controller: controllerKeluhan,
                                        decoration: InputDecoration(
                                          labelText: 'Keluhan',
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
