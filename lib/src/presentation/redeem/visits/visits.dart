import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/redeem/coins/submit_use_coin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class Visits extends StatefulWidget {
  final snap;
  final int index;
  final String hotelName;
  const Visits({
    super.key,
    required this.snap,
    required this.index,
    required this.hotelName,
  });

  @override
  State<Visits> createState() => VisitsState();
}

class VisitsState extends State<Visits> {
  @override
  Widget build(BuildContext context) {
    final visits = int.parse(
      widget.snap['visits'],
    );

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
                offerPrice: visits,
                isVisit: true,
              ),
            ),
          ),
          child: Container(
            height: 100,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  widget.snap['image'],
                ),
                fit: BoxFit.fitWidth,
                opacity: 80,
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
                  widget.snap['visits'],
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
