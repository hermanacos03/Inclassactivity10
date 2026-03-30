import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'intor.dart';

class SuccessScreen extends StatefulWidget {
  final String userName;
  const SuccessScreen({super.key, required this.userName});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _confetti;
  late AnimationController _scale;

  @override
  void initState() {
    super.initState();
    _confetti = ConfettiController(duration: const Duration(seconds: 3));
    _scale = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    Future.delayed(const Duration(milliseconds: 200), () {
      _confetti.play();
      _scale.forward();
    });
  }

  @override
  void dispose() {
    _confetti.dispose();
    _scale.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final firstName = widget.userName.split(' ').first;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'You Did It!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 39, 176, 149), 
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Confetti
          ConfettiWidget(
            confettiController: _confetti,
            blastDirectionality: BlastDirectionality.explosive,
            colors: const [
              Color.fromARGB(255, 39, 176, 149), 
              Colors.purple,                      
              Colors.yellow,
            ],
          ),

          // Main content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Bouncing checkmark
                  ScaleTransition(
                    scale: CurvedAnimation(
                      parent: _scale,
                      curve: Curves.elasticOut,
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.purple,
                      child: Icon(Icons.check_rounded, size: 52, color: Colors.white),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Text(
                    'Welcome, $firstName! 🎉',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold, 
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'Your account was created successfully.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 48),

                  
                  ElevatedButton(
                    onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const Intor()),
                      (_) => false,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Back to Start',
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