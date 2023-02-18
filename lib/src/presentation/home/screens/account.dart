import 'package:chai/src/data/utils/global_var.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 45,
            foregroundImage: NetworkImage(
              auth.currentUser!.photoURL ??
                  "https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_960_720.png",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '${auth.currentUser!.displayName}',
            style: TextStyle(
              fontSize: 18,
              color: textColor,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            // onTap: () {},
            leading: Icon(Icons.email_outlined, color: textColor),
            title: Text(
              '${auth.currentUser!.email}',
              style: TextStyle(color: textColor),
            ),
          ),
          ListTile(
            // onTap: () => {},
            leading: Icon(Icons.coffee_sharp, color: textColor),
            title: Text(
              'Buy us a chai',
              style: TextStyle(color: textColor),
            ),
          ),
          ListTile(
            // onTap: () => {},
            leading: Icon(Icons.question_mark_sharp, color: textColor),
            title: Text(
              'About',
              style: TextStyle(color: textColor),
            ),
          ),
          ListTile(
            onTap: () => auth.signOut(),
            leading: Icon(Icons.logout_outlined, color: textColor),
            title: Text(
              'Logout',
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
    );
  }
}
