import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wasla/core/errors/exception.dart';
import 'package:wasla/core/errors/failure.dart';
import 'package:wasla/features/auth/data/models/user_model.dart';

class AuthRemoteDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<Either<Failure, Unit>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final idUser = userCredential.user!.uid;
      final updatedUser = UserModel(email: email, name: name, id: idUser);
      await firestore.collection('users').doc(idUser).set(updatedUser.toMap());
      return right(unit);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.code);
    }
  }

  Future<Either<Failure, Unit>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.code);
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
