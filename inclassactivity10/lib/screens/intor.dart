import 'package:flutter/material.dart';
import 'login.dart';

class Intor extends StatelessWidget {
  const Intor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        title: const Text(
          'Stages',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFFFF9C4),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: ElevatedButton(
  onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SignupPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 80,
          vertical: 30,
        ),
        textStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: const Text('Go to Signup Page'),
    ),
      ),
    );
  }
}