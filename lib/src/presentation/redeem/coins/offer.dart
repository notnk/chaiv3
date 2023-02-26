import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'submit_use_coin.dart';

class Offers extends StatefulWidget {
  final snap;
  final int index;
  final String hotelName;
  const Offers({
    super.key,
    required this.snap,
    required this.index,
    required this.hotelName,
  });

  @override
  State<Offers> createState() => OffersState();
}

class OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    final coin = int.parse(widget.snap['coin']);
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(
            SwipeablePageRoute(
              builder: (context) => SubmitUseCoin(
                hotelName: widget.hotelName,
                offerPrice: coin,
                isVisit: false,
              ),
            ),
          ),
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.snap['image'],
                ),
                fit: BoxFit.fitWidth,
                opacity: 80,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: ListTile(
                title: Text(
                  widget.snap['name'],
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                trailing: Text(
                  widget.snap['coin'],
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
