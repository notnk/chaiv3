import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/home/screens/explore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'src/presentation/login/intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        scaffoldBackgroundColor: newBackgroundColor,
        // textTheme: const TextTheme(
        //   bodyText2: TextStyle(
        //     color: textColor,
        //   ),
        //   bodyText1: TextStyle(
        //     color: textColor,
        //   ),
        // ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const ExplorePage();
          } else {
            return const IntroPage();
          }
        },
      ),
    ),
  );
}
