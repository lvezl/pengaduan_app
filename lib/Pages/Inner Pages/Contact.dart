import 'package:flutter/material.dart';
import 'package:pengaduan_app/Pages/Home_pages.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
          'Contact',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: content(),
    );
  }

  Widget content() {
    final Uri whatsapp1 = Uri.parse('https://wa.me/+6283189887622');
    final Uri whatsapp2 = Uri.parse('tel:+62-831-8988-7622');
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (() async {
                launchUrl(whatsapp1);
              }),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('lib/asset/wa.png'),
                    height: 80,
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Admin 1',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: (() async {
                launchUrl(whatsapp2);
              }),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('lib/asset/wa.png'),
                    height: 80,
                    color: Colors.green,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Admin 2',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
