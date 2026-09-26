import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screen/registrasi.dart';

void main() {
  runApp(const LostAndFoundApp());
}

class LostAndFoundApp extends StatelessWidget {
  const LostAndFoundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kampus Lost & Found',
      home: const RegisterScreen(),
    );
  }
}