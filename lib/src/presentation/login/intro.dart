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
            color: Colors.black,
            activeColor: Colors.white,
          ),
          back: Text(
            'Back',
            style: TextStyle(
              color: textColor,
            ),
          ),
          skip: Text(
            "Skip",
            style: TextStyle(
              color: textColor,
            ),
          ),
          done: Text(
            "Login",
            style: TextStyle(
              color: textColor,
            ),
          ),
          dotsFlex: 3,
          onDone: () => onTapLogin(),
          pages: [
            PageViewModel(
              title: '1',
              body:
                  'This is not the final build\n dont forwards this apk\nThe images inside have not been finilized',
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
            PageViewModel(
              title: 'Passwords',
              // body: 'Passwords',
              bodyWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                      "betterlife 2023\nbullring 2001\nhappyrolls 2022\nmeltyway 200006\nstyleon 2000"),
                ],
              ),
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
            ),
            PageViewModel(
              decoration: const PageDecoration(
                bodyAlignment: Alignment.center,
              ),
              title: 'Login',
              body: 'Login using Google',
            ),
          ],
        ),
      ),
    );
  }
}
