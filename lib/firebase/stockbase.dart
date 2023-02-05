import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/stock_model.dart';
import '../models/usermodel.dart';

class StockTransactionDB {

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('StockTransactions');

    Future<void> addNewStockTransaction(StockTransaction stockTransaction) async {
      return _collectionRef
          .add(stockTransaction.toJson())
          .then((value) => print("StockTransaction entry added"))
          .catchError((error) => print("Failed to add entry: $error"));
    }

    Future<void> reduce_wallet_by(int cost) async {
        FirebaseAuth auth = FirebaseAuth.instance;

        CollectionReference users = FirebaseFirestore.instance.collection('users');

        await users.doc(FirebaseAuth.instance.currentUser!.uid).get().then((doc) {
            bool exist = doc.exists;
            if (exist == true) {
              print('exist');

              doc.reference.update({
                'fincoin': FieldValue.increment(-cost)});

              // users
              //     .doc(user.uid)
              //     .set(cuser.toJson())
              //     .then((value) => print("User Added"))
              //     .catchError((error) => print("Failed to add user: $error"));
            }
          });

    }

}