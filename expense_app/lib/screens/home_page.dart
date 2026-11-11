
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.white,
  appBar: AppBar(
    title: Row(
  children: [
    Image.asset(
      'assets/budgetcolor.png',
      height: 35,
      width: 35,
      fit: BoxFit.contain,
    ),
    const SizedBox(width: 10),
    const Text(
      'Expense Tracker',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ],
),
    backgroundColor: const Color(0xFF142D4E),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  body: const Center(
    child: Text(
      'Welcome to your Expense Tracker!',
      style: TextStyle(
        fontSize: 20,
        color: Color(0xFF142D4E),
      ),
    ),
  ),
);
  }
}
