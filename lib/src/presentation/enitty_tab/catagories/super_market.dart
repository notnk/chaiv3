import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/enitty_tab/screens/better_life.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class SuperMarketPage extends StatefulWidget {
  const SuperMarketPage({super.key});

  @override
  State<SuperMarketPage> createState() => _SuperMarketPageState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

var uid = FirebaseAuth.instance.currentUser!.uid;

class _SuperMarketPageState extends State<SuperMarketPage> {
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
                      "Avaliable SuperMarkets",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
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
                            builder: (context) => const BetterLife(),
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
                                      "lib/src/assets/betterLife.jpg",
                                    ),
                                    fit: BoxFit.fill,
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
                                        "Better Life",
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
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(7),
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
                                                    '${uid}BetterLife')) {
                                                  return Center(
                                                    child: Text(
                                                      '${snapshot.data!.docs[index].data()['coin']} ',
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
                                                Icons.local_grocery_store,
                                                color: textColor,
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "FortKochi",
                                                style: TextStyle(
                                                  color: textColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // const Text(
                                          //   "10% Discount",
                                          //   style: TextStyle(
                                          //     color: textColor,
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
