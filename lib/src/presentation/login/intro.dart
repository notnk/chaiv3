import 'package:chai/src/data/firebase/auth_methods.dart';
import 'package:chai/src/data/utils/global_var.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  onTapLogin() async {
    await AuthMethods().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(3),
        child: IntroductionScreen(
          globalBackgroundColor: newBackgroundColor,
          next: const Icon(Icons.navigate_next_outlined),
          showSkipButton: true,
          baseBtnStyle: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
              Colors.white10,
            ),
          ),
          backSemantic: 'Back',
          dotsDecorator: const DotsDecorator(
            color: newBackgroundColor,
            activeColor: Colors.black,
          ),
          back: const Text(
            'Back',
            style: TextStyle(
              color: textColor,
            ),
          ),
          skip: const Text(
            "Skip",
            style: TextStyle(
              color: textColor,
            ),
          ),
          done: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Icon(
                Icons.g_mobiledata_rounded,
                size: 23,
              ),
              Text(
                "Login",
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                ),
              ),
            ],
          ),
          dotsFlex: 3,
          onDone: () => onTapLogin(),
          pages: [
            PageViewModel(
              title: '',
              bodyWidget: Image.asset(
                'lib/src/assets/1.png',
              ),
            ),
            PageViewModel(
              title: '',
              bodyWidget: Image.asset(
                'lib/src/assets/2.png',
              ),
            ),
            PageViewModel(
              bodyWidget: Image.asset(
                'lib/src/assets/3.png',
              ),
              title: '',
            ),
          ],
        ),
      ),
    );
  }
}
