import 'dart:developer';
import 'package:chai/src/data/firebase/auth_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateValues {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<String> addValues({
    required final String hotelName,
    required final int enteredCode,
    required final int enteredAmount,
  }) async {
    final hotelDetails =
        await AuthMethods().getHotelDetails(hotelName: hotelName);
    try {
      await AuthMethods().getUserDetails(hotelName: hotelName);
    } catch (e) {
      log(e.toString());
      _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set({
        'coin': 0,
        'visit': 0,
      });
    }
    final userDetails =
        await AuthMethods().getUserDetails(hotelName: hotelName);
    if (hotelDetails.code == enteredCode) {
      int coinAdded = 0;
      if (hotelName == 'BetterLife') {
        coinAdded = (enteredAmount) + userDetails.coin;
      } else {
        coinAdded = (enteredAmount * 2) + userDetails.coin;
      }
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set({
        'coin': coinAdded,
        'visit': userDetails.visit + 1,
      });
      return 'succ';
    }
    return 'error';
  }

  Future<String> addVisits({
    required final String hotelName,
    required final int enteredCode,
  }) async {
    final hotelDetails =
        await AuthMethods().getHotelDetails(hotelName: hotelName);
    try {
      await AuthMethods().getUserDetails(hotelName: hotelName);
    } catch (e) {
      log(e.toString());
      _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set({
        'coin': 0,
        'visit': 0,
      });
    }
    final userDetails =
        await AuthMethods().getUserDetails(hotelName: hotelName);
    if (hotelDetails.code == enteredCode) {
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set({
        'coin': userDetails.coin,
        'visit': userDetails.visit + 1,
      });
      return 'succ';
    }
    return 'error';
  }

  Future<String> minusCoins({
    required final hotelName,
    required final offerPrice,
    required final enteredCode,
  }) async {
    final hotelDetails =
        await AuthMethods().getHotelDetails(hotelName: hotelName);
    try {
      await AuthMethods().getUserDetails(hotelName: hotelName);
    } catch (e) {
      log("the user hasnt registred$e");
      //show the user isnt registered
      return 'error';
    }
    final userDetails =
        await AuthMethods().getUserDetails(hotelName: hotelName);

    if (hotelDetails.code == enteredCode && userDetails.coin >= offerPrice) {
      final coinMinused = userDetails.coin - offerPrice;
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set({
        'coin': coinMinused,
        'visit': userDetails.visit,
      });
      return 'succ';
    }

    return 'error';
  }

  Future<String> minusVisits({
    required final hotelName,
    required final offerPrice,
    required final enteredCode,
  }) async {
    final hotelDetails =
        await AuthMethods().getHotelDetails(hotelName: hotelName);
    try {
      await AuthMethods().getUserDetails(hotelName: hotelName);
    } catch (e) {
      log("the user hasnt registred$e");
      //show the user isnt registered
      return 'error';
    }
    final userDetails =
        await AuthMethods().getUserDetails(hotelName: hotelName);

    if (hotelDetails.code == enteredCode && userDetails.visit >= offerPrice) {
      final visitMinused = userDetails.visit - offerPrice;
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid + hotelName)
          .set({
        'coin': userDetails.coin,
        'visit': visitMinused,
      });
      return 'succ';
    }

    return 'error';
  }
}
