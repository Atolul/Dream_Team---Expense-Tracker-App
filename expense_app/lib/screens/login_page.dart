
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'signup_page.dart';
import '../auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController =
      TextEditingController();

  final TextEditingController _passwordController =
      TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email and password.'),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await AuthService().signIn(
        email: email,
        password: password,
      );

      // AuthGate automatically opens Home after successful login.

    } on FirebaseAuthException catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AuthService.errorMessage(error)),
        ),
      );
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to log in. Please try again.'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/budgetcolor.png',
                  height: 180,
                   fit: BoxFit.contain,
                ),

                const SizedBox(height: 20),

                const Text(
                  'Expense Tracker',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF142D4E),
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Welcome back! Please log in.',
                  style: 
                  TextStyle(
                    fontSize: 16, 
                    color: Color(0xFF142D4E), 
                ),
                ),
                
                const SizedBox(height: 30),

TextField(
  controller: _emailController,
  keyboardType: TextInputType.emailAddress,
  style: const TextStyle(
    color: Colors.black,
    fontSize: 16,
  ),
  cursorColor: const Color(0xFF142D4E),
  decoration: const InputDecoration(
    labelText: 'Email',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.email),
  ),
),

const SizedBox(height: 20),

        TextField(
  controller: _passwordController,
  obscureText: true,
  style: const TextStyle(
    color: Colors.black,
    fontSize: 16,
  ),
  cursorColor: const Color(0xFF142D4E),
  decoration: const InputDecoration(
    labelText: 'Password',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.lock),
  ),
),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF142D4E),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(15),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Login'),
                  ),
                ),

                const SizedBox(height: 15),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Color(0xFF142D4E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
