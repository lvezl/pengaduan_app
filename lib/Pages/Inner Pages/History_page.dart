import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pengaduan_app/Pages/Home_pages.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final CollectionReference _pengaduan =
      FirebaseFirestore.instance.collection('pengaduan');
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
          'History',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 500,
            child: StreamBuilder(
                stream: _pengaduan.snapshots(),
                builder: (context, AsyncSnapshot snapshots) {
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return Center(
                      child:
                          CircularProgressIndicator(color: Color(0xffDDDADA)),
                    );
                  }

                  if (snapshots.hasData) {
                    return ListView.builder(
                        itemCount: snapshots.data!.docs.length,
                        itemBuilder: (context, Index) {
                          final DocumentSnapshot records =
                              snapshots.data!.docs[Index];
                          return Slidable(
                              startActionPane: ActionPane(
                                motion: StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) {},
                                    icon: Icons.delete,
                                    backgroundColor: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                  color: Colors.black,
                                  width: 1,
                                ))),
                                child: ListTile(
                                  title: Text(
                                    records['opd'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  subtitle: Text(
                                    records['keluhan'],
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ),
                              ));
                        });
                  } else {}

                  return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xffDDDADA),
                    ),
                  );
                }),
          )
        ]),
      )),
    );
  }
}
