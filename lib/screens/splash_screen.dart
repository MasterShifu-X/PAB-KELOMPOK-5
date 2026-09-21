import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 112,
                height: 112,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo.shade50,
                  border: Border.all(color: Colors.indigo.shade100, width: 2),
                ),
                child: Icon(
                  Icons.self_improvement,
                  size: 58,
                  color: Colors.indigo.shade700,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Habit Tracker',
                style: TextStyle(
                  color: Color(0xFF1A237E),
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Grow Better, Every Day.',
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}