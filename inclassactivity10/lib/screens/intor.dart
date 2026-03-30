import 'package:flutter/material.dart';
import 'login.dart';

class Intor extends StatelessWidget {
  const Intor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4), // pale yellow
      appBar: AppBar(
        title: const Text('Stages'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignupPage(),
                ),
              );
            },
            child: const Text('Go to Signup Page'),
          ),
        ],
      ),
    );
  }
}