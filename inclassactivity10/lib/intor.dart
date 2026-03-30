import 'package:flutter/material.dart';
import 'login.dart';

class Intor extends StatelessWidget {
  const Intor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stages'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_one),
              title: const Text('Open Signup Page'),
              subtitle: const Text('Tap to go to the form page'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignupPage(),
                  ),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_two),
              title: const Text('Stage 2'),
              subtitle: const Text('You can connect another page here later'),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_3),
              title: const Text('Stage 3'),
              subtitle: const Text('You can connect another page here later'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}