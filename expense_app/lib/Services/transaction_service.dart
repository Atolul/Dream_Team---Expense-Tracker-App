import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//CRUD methods for firestore
class TransactionService {
  // instance of the firestore Db
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // instance of Firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get current logged-in UID
  String get userId {
    final user = _auth.currentUser;

    if (user == null) {
      throw StateError("No user is currently logged in. ");
    }
    return user.uid;
  }

  // reference of transactions for logged-in user
  CollectionReference<Map<String, dynamic>> userTransactions() {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('transactions');
  }

  // NEW transaction to user firestore collection
  Future<void> addTransaction({
    required String title,
    required double amount,
    required String categoryId,
    required String type,
    required DateTime date,
  }) async {
    // get user transaction
    final transactions = userTransactions();

    // create new transaction document in fs
    await transactions.add({
      'title': title,
      'amount': amount,
      'categoryId': categoryId,
      'type': type,
      'date': Timestamp.fromDate(date),
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  //RETRIEVE transaction from firestore
  Stream<QuerySnapshot<Map<String, dynamic>>> getTransactions() {
    return userTransactions().orderBy('date', descending: true).snapshots();
  }

  // UPDATE transaction to firestore collection
  Future<void> updateTransaction({
    required String transactionId,
    required String title,
    required double amount,
    required String categoryId,
    required String type,
    required DateTime date,
  }) async {
    // Get transaction document
    final transaction = userTransactions().doc(transactionId);

    // update transaction fields in Firestore
    await transaction.update({
      'title': title,
      'amount': amount,
      'categoryId': categoryId,
      'type': type,
      'date': Timestamp.fromDate(date),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  // DELETE existing transaction from firestore
  Future<void> deleteTransaction({required String transactionId}) async {
    // Get transaction doc
    final transaction = userTransactions().doc(transactionId);

    // Delete the transaction from Firestore
    await transaction.delete();
  }
}
