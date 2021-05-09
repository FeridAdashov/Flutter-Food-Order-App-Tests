import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_restaurant_order/Screens/Models/product.dart';
import 'package:flutter_restaurant_order/Screens/Models/user.dart';

class DatabaseService {
  final String name;

  final CollectionReference productsReference =
      FirebaseFirestore.instance.collection('products');

  final CollectionReference usersReference =
      FirebaseFirestore.instance.collection('users');

  DatabaseService({this.name});

  Future setProductData(
      String name, String newName, String sugar, int strength) async {
    await deleteProduct(name);

    return await productsReference.doc(name).set({
      'sugar': sugar,
      'strength': strength,
    });
  }

  Future deleteProduct(String name) async {
    productsReference.doc(name).delete();
  }

  Stream<QuerySnapshot> get productSnapshot {
    return productsReference.snapshots();
  }

  List<Product> _productListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      var mData = doc.data();
      return Product(
        name: doc.id ?? '',
        sugar: mData['sugar'] ?? '',
        strength: mData['strength'] ?? 0,
      );
    }).toList();
  }

  Stream<List<Product>> get products {
    return productSnapshot.map(_productListFromSnapshot);
  }

  Future deleteUserData(String name) async {
    usersReference.doc(name).delete();
  }

  Future setUserData(String password, String type) async {
    // await deleteUserData(name);

    return await usersReference.doc(name).set({
      'password': password,
      'type': type,
    });
  }

  //UserData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      snapshot.id,
      snapshot.data()['password'],
      snapshot.data()['type'],
    );
  }

  //get user doc stream
  Stream<UserData> userData() {
    return usersReference.doc(name).snapshots().map(_userDataFromSnapshot);
  }

  Future<String> getUserType() async {
    return (await usersReference.doc(name).get()).data()['type'];
  }
}
