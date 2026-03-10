import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:wasla/core/errors/exception.dart';
import 'package:wasla/core/common/models/user_model.dart';
import 'package:wasla/core/errors/failure.dart';

class AuthRemoteDataSource {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<Unit> signUp({
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
      return unit;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.code);
    } on TimeoutException catch (_) {
      throw TimeException(message: "الرجاء التحقق من الاتصال بالإنترنت");
    }
  }

  Future<Unit> signIn({required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(Duration(seconds: 7));
      return unit;
    } on FirebaseAuthException catch (e) {
      throw AuthException(message: e.code);
    } on TimeoutException {
      throw TimeException(message: "الرجاء التحقق من الاتصال بالإنترنت");
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }

  Future<Either<Failure, String>> sendOtp({required String email}) async {
    String otpCode = (Random().nextInt(90000) + 10000).toString();

    try {
      final userName = 'mohammedabomatter@gmail.com';
      String password = 'wqiu cxux kwvc smpr';
      final SmtpServer smtpServer = gmail(userName, password);
      final message =
          Message()
            ..from = Address(userName, 'Wasla Support')
            ..recipients.add(email)
            ..text = 'كود التحقق الخاص بك اياك ان تشاركه مع احد $otpCode'
            ..subject = 'كود التحقق الخاص بتطبيق وصلة ';
      await send(message, smtpServer).timeout(Duration(seconds: 20));
    } on SmtpMessageValidationException catch (e) {
      throw SmtpExcption(message: e.message);
    } on Exception catch (_) {
      throw Exception();
    }
    return right(otpCode);
  }

  Future<void> updatePassword() async {}
}
