import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/home/screens/explore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class SuccPage extends StatefulWidget {
  const SuccPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SuccPage> createState() => _SuccPageState();
}

class _SuccPageState extends State<SuccPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Succes",
          style: GoogleFonts.bebasNeue(
            color: textColor,
            fontSize: 40,
          ),
        ),
        backgroundColor: newBackgroundColor,
        centerTitle: true,
      ),
      backgroundColor: newBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: primaryColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(5, 5),
                    blurRadius: 3,
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: const Center(
                child: Text(
                  "The operation was successful.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            const Center(
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 200,
                color: Colors.green,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    offset: Offset(1, 1),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: const ButtonStyle(
                enableFeedback: true,
              ),
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                SwipeablePageRoute(
                  builder: (context) => const ExplorePage(),
                ),
                (route) => false,
              ),
              child: const Center(
                child: Text(
                  "HOME",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: textColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
