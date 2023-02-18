import 'package:chai/src/data/utils/global_var.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:firebase_core/firebase_core.dart';
import 'src/presentation/home/screens/explore.dart';
import 'src/presentation/login/intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      theme: ThemeData(
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        // primaryColor: primaryColor,
        useMaterial3: true,
        scaffoldBackgroundColor: newBackgroundColor,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const NewExplorePage();
          } else {
            return const IntroPage();
          }
        },
      ),
    ),
  );
}
