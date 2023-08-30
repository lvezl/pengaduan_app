import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pengaduan_app/Pages/Inner%20Pages/Contact.dart';
import 'package:pengaduan_app/Pages/Inner%20Pages/History_page.dart';
import 'package:pengaduan_app/Pages/Inner%20Pages/Pengaduan.dart';
import 'package:pengaduan_app/Pages/Inner%20Pages/Status_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  Widget _selectedExtras({
    required String image,
    required String name,
  }) {
    {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: Colors.grey.shade500, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDDADA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Pengaduan Jaringan',
          style: TextStyle(
              fontSize: 26, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                Image(
                  image: AssetImage(
                    'lib/asset/kominfo.png',
                  ),
                  alignment: Alignment.center,
                  width: 110,
                  height: 120,
                ),
                Text(
                  'Kominfo Lombok Barat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Divider(
                    color: Colors.lightBlue[400],
                  ),
                ),

                //page lainnya
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.lightBlue[400]),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.lightBlue[400]),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.lightBlue[400]),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.lightBlue[400]),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, bottom: 25),
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.lightBlue[400]),
                  title: Text(
                    'Log out',
                    style: TextStyle(color: Colors.lightBlue[400]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xffDDDADA),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30),
              child: Text(
                'Masuk Sebagai',
                style: TextStyle(
                    fontSize: 19,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pilih Layanan',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Container(
                      height: 300,
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 8,
                        childAspectRatio: 1.30,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => Tiket()));
                            },
                            child: _selectedExtras(
                              image: 'lib/asset/document.png',
                              name: 'Pengaduan',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => StatusPage()));
                            },
                            child: _selectedExtras(
                              image: 'lib/asset/clipboard.png',
                              name: 'Status',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HistoryPage()));
                            },
                            child: _selectedExtras(
                              image: 'lib/asset/history.png',
                              name: 'History',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => ContactPage()));
                            },
                            child: _selectedExtras(
                              image: 'lib/asset/user.png',
                              name: 'Contact',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
