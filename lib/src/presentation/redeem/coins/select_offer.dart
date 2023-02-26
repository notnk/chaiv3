import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/redeem/coins/offer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SelectOffer extends StatefulWidget {
  final String hotelName;
  const SelectOffer({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<SelectOffer> createState() => _SelectOfferState();
}

class _SelectOfferState extends State<SelectOffer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Offers avaliable",
          style: TextStyle(
            color: textColor,
          ),
        ),
        backgroundColor: newBackgroundColor,
      ),
      backgroundColor: newBackgroundColor,
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection(widget.hotelName).snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return SingleChildScrollView(
                child: Offers(
                  hotelName: widget.hotelName,
                  snap: snapshot.data!.docs[index].data(),
                  index: index,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
