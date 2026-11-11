import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';

Future<void> main() async {
  // initialize flutter before calling fb
  WidgetsFlutterBinding.ensureInitialized();

  // initialize the Fb connection
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //start application
  runApp(const ExpenseTrackerApp());
}
class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}


// void main() {
//   runApp(const ExpenseTrackerApp());
// }




