import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasla/core/common/models/user_model.dart';

class ProfileRemoteDataSource {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<UserModel> getUserInfo() async {
    final currentUser = auth.currentUser!;
    final doc = await firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromMap(doc.data()!);
  }
}
