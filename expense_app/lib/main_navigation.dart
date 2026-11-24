
import 'package:flutter/material.dart';

import 'auth_service.dart';
import 'screens/home_page.dart';
import 'screens/transactions_page.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

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

          actions: [
            IconButton(
              tooltip: 'Logout',
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await AuthService().signOut();
              },
            ),
          ],

          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.receipt_long),
                text: 'Transactions',
              ),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            HomePage(),
            TransactionsPage(),
          ],
        ),
      ),
    );
  }
}
