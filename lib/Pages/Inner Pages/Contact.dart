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
    final Uri whatsapp = Uri.parse('https://wa.me/083189887622');
    final Uri phoneNumber = Uri.parse('tel:+62-831-898-876-22');
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: (() async {
                launchUrl(whatsapp);
              }),
              child: Image(
                image: AssetImage('lib/asset/wa.png'),
                height: 80,
                color: Colors.green,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
                onTap: (() async {
                  print(await canLaunchUrl(phoneNumber));
                }),
                child: Icon(
                  Icons.call,
                  size: 80,
                  color: Colors.green,
                )),
          ],
        ),
      ),
    );
  }
}
