import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/enitty_tab/screens/bullring.dart';
import 'package:chai/src/presentation/enitty_tab/screens/bullringE.dart';
import 'package:chai/src/presentation/enitty_tab/screens/bullringT.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({super.key});

  @override
  State<SportsPage> createState() => _SportsPageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

var uid = FirebaseAuth.instance.currentUser!.uid;

class _SportsPageState extends State<SportsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: verticalPadding,
                    ),
                    child: Text(
                      "Avaliable Sports Centers",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 13),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          SwipeablePageRoute(
                            builder: (context) => const BullRing(),
                          ),
                        ),
                        child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: primaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 0,
                                ),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "lib/src/assets/bullring.jpg",
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Text(
                                        "BullRing FC",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      trailing: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3,
                                            ),
                                          ],
                                        ),
                                        width: 47,
                                        height: 23,
                                        child: StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('users')
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<
                                                      QuerySnapshot<
                                                          Map<String, dynamic>>>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white38,
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
                                                if ((snapshot
                                                        .data!.docs[index].id ==
                                                    '${uid}BullRing')) {
                                                  return Center(
                                                    child: Text(
                                                      '${snapshot.data!.docs[index].data()['visit']} ',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: textColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return const SizedBox.shrink();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.sports_soccer_rounded,
                                                color: textColor,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Panampilly",
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          SwipeablePageRoute(
                            builder: (context) => const BullRingE(),
                          ),
                        ),
                        child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: primaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 0,
                                ),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "lib/src/assets/bullring.jpg",
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Text(
                                        "BullRing FC",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      trailing: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3,
                                            ),
                                          ],
                                        ),
                                        width: 47,
                                        height: 23,
                                        child: StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('users')
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<
                                                      QuerySnapshot<
                                                          Map<String, dynamic>>>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white38,
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
                                                if ((snapshot
                                                        .data!.docs[index].id ==
                                                    '${uid}BullRingE')) {
                                                  return Center(
                                                    child: Text(
                                                      '${snapshot.data!.docs[index].data()['visit']} ',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: textColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return const SizedBox.shrink();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.sports_soccer_rounded,
                                                color: textColor,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Edapally",
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const Text(
                                          //   "600 for 1 slot min",
                                          //   style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          SwipeablePageRoute(
                            builder: (context) => const BullRingT(),
                          ),
                        ),
                        child: Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: primaryColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 0,
                                ),
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "lib/src/assets/bullring.jpg",
                                    ),
                                    fit: BoxFit.fitWidth,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Text(
                                        "BullRing FC",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      trailing: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3,
                                            ),
                                          ],
                                        ),
                                        width: 47,
                                        height: 23,
                                        child: StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection('users')
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<
                                                      QuerySnapshot<
                                                          Map<String, dynamic>>>
                                                  snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white38,
                                                ),
                                              );
                                            }
                                            return ListView.builder(
                                              shrinkWrap: true,
                                              itemCount:
                                                  snapshot.data!.docs.length,
                                              itemBuilder: (context, index) {
                                                if ((snapshot
                                                        .data!.docs[index].id ==
                                                    '${uid}BullRingT')) {
                                                  return Center(
                                                    child: Text(
                                                      '${snapshot.data!.docs[index].data()['visit']} ',
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                        color: textColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                return const SizedBox.shrink();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 18,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: const [
                                              Icon(
                                                Icons.sports_tennis_sharp,
                                                color: textColor,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Pipeline Rd, Edapally",
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const Text(
                                          //   "600 for 1 slot min",
                                          //   style: TextStyle(
                                          //     color: Colors.white,
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
