import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'finish.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordController2 = TextEditingController();

  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordController2.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _confettiController.play();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Welcome! Punk, I mean ${_nameController.text} created successfully.',
          ),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SuccessScreen(
            userName: _nameController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2DEDE),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'WASSUP BROTHA!!!',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 39, 176, 149),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            emissionFrequency: 0.05,
            numberOfParticles: 25,
            gravity: 0.2,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText('Create Your Account'),
                          FadeAnimatedText('Join the Squad'),
                          FadeAnimatedText('Sign Up Below'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter an email with @ as it is not valid "example@gmail.com"';
                      }
                      if (!value.contains('.com') &&
                          !value.contains('.org') &&
                          !value.contains('.mil') &&
                          !value.contains('.net') &&
                          !value.contains('.edu')) {
                        return 'Please enter an email with a tag like .org';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  TextFormField(
                    controller: _passwordController2,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password confirmation',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'That password is not the same fool!';
                      }
                      if (value != _passwordController.text) {
                        return 'This password is not the same fool';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),

                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}