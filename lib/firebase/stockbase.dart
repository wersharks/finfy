import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/stock_model.dart';

class StockTransactionDB {

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('StockTransactions');

    Future<void> addNewStockTransaction(StockTransaction stockTransaction) async {
      return _collectionRef
          .add(stockTransaction.toJson())
          .then((value) => print("StockTransaction entry added"))
          .catchError((error) => print("Failed to add entry: $error"));
    }

  
}