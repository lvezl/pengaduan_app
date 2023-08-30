import 'package:flutter/material.dart';
import 'package:pengaduan_app/Pages/Login_pages.dart';
import 'package:pengaduan_app/Pages/Register_pages.dart';

class AutentifikasiPage extends StatefulWidget {
  const AutentifikasiPage({super.key});

  @override
  State<AutentifikasiPage> createState() => _AutentifikasiPageState();
}

class _AutentifikasiPageState extends State<AutentifikasiPage> {
  // awal, memunculkan login page
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
