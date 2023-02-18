import 'package:chai/src/data/firebase/update_values.dart';
import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/redeem/succ.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetVisit extends StatefulWidget {
  final String hotelName;
  const GetVisit({Key? key, required this.hotelName}) : super(key: key);

  @override
  State<GetVisit> createState() => _GetVisitState();
}

class _GetVisitState extends State<GetVisit> {
  final TextEditingController _codeEditingController = TextEditingController();
  bool isLoading = false;
  _checkAmount() async {
    final code = int.parse(_codeEditingController.text.trim());
    setState(() {
      isLoading = true;
    });
    if (code > 100) {
      String res = await UpdateValues().addVisits(
        hotelName: widget.hotelName,
        enteredCode: code,
      );
      if (res != 'succ') {
        showDialog(
          barrierLabel: "Error",
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(
              'Wrong code',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        );
      } else {
        if (mounted) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => SuccPage(
                  hotelName: widget.hotelName,
                ),
              ),
              (route) => false);
        }
      }
    } else {
      showDialog(
        barrierLabel: "Error",
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text(
            'Min amount is 100',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return Scaffold(
      backgroundColor: newBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Text(
              widget.hotelName,
              style: GoogleFonts.bebasNeue(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            TextField(
              controller: _codeEditingController,
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: inputBorder,
                enabledBorder: inputBorder,
                hintText: 'Code is Confidential',
                hintStyle: TextStyle(
                  color: textColor,
                ),
                label: Text(
                  "Enter Code",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                fillColor: Colors.white10,
                filled: true,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              " Code should be entred by the offical member ",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: textColor,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () => isLoading == false ? _checkAmount() : null,
              child: Container(
                width: 100,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryColor,
                ),
                child: Center(
                  child: isLoading == false
                      ? Text(
                          "Submit",
                          style: TextStyle(color: textColor),
                        )
                      : const CircularProgressIndicator(
                          color: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _codeEditingController.dispose();
  }
}
