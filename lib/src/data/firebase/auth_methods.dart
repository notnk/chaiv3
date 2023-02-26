import 'dart:developer';
import 'package:chai/src/data/models/coin_get_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/hotel_model.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<FBUser> getUserDetails({
    required final String hotelName,
  }) async {
    User currentUser = _auth.currentUser!;
    final documentSnapshot = await _firebaseFirestore
        .collection('users')
        .doc(currentUser.uid + hotelName)
        .get();

    return FBUser.fromSnap(documentSnapshot);
  }

  Future<Hotel> getHotelDetails({
    required final String hotelName,
  }) async {
    final documentSnapshot =
        await _firebaseFirestore.collection('hotels').doc(hotelName).get();

    return Hotel.fromSnap(documentSnapshot);
  }

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser =
          await GoogleSignIn.standard().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      AndroidOptions getAndroidOptions() => const AndroidOptions(
            encryptedSharedPreferences: true,
          );
      final storage = FlutterSecureStorage(
        aOptions: getAndroidOptions(),
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      storage.write(
        key: 'cred',
        value: credential.toString(),
      );
      if (userCredential.user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          const AlertDialog(
            content: Text(
              'Welcome to Chai',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
          // _firebaseFirestore
          //     .collection('UserDetails')
          //     .doc(googleUser!.email)
          //     .set(
          //   {
          //     'name': googleUser.displayName,
          //     'photoUrl': googleUser.photoUrl,
          //   },
          // );
        }
      }

      return 'succ';
    } catch (e) {
      log(
        e.toString(),
      );
    }
    return 'error';
  }
}
