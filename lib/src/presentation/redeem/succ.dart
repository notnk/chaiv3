import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/home/screens/explore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccPage extends StatefulWidget {
  final String hotelName;
  const SuccPage({Key? key, required this.hotelName}) : super(key: key);

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
          style: GoogleFonts.numans(color: textColor, fontSize: 40),
        ),
        backgroundColor: newBackgroundColor,
        centerTitle: true,
      ),
      backgroundColor: newBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: const Center(
                child: Text(
                  "The Sugar cubes have been successfully added into your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const Center(
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 200,
                color: Colors.green,
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NewExplorePage(),
                ),
              ),
              child: const Center(
                child: Text("Home"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
