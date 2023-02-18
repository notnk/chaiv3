import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  final String hotelName;
  final int code;
  const Hotel({
    required this.hotelName,
    required this.code,
  });
  static Hotel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Hotel(
      hotelName: snapshot['name'],
      code: snapshot['code'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": hotelName,
        "code": code,
      };
}
