import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:a1_1_20/models/user.dart';

class UserService {
  CollectionReference _userRefrance =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userRefrance.doc(user.id).set({
        'nama': user.nama,
        'email': user.email,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    try {
      DocumentSnapshot snapshot = await _userRefrance.doc(id).get();
      return UserModel(
          id: id, email: snapshot['email'], nama: snapshot['nama']);
    } catch (e) {
      throw e;
    }
  }
}
