import 'package:cloud_firestore/cloud_firestore.dart';

class FBUser {
  final int coin;
  final int visit;
  FBUser({
    required this.coin,
    required this.visit,
  });

  static FBUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return FBUser(
      coin: snapshot['coin'],
      visit: snapshot['visit'],
    );
  }

  Map<String, dynamic> toJson() => {
        "coin": coin,
        "visit": visit,
      };
}
