import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/redeem/visits/get_visit.dart';
import 'package:chai/src/presentation/redeem/visits/select_visits.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import 'package:url_launcher/url_launcher.dart';

class BullRing extends StatefulWidget {
  const BullRing({
    super.key,
  });

  @override
  State<BullRing> createState() => _BullRingState();
}

class _BullRingState extends State<BullRing> {
  var uid = FirebaseAuth.instance.currentUser!.uid;
  final fbUrl = Uri.parse('https://www.facebook.com/bullringfckochi');
  final locationUrl = Uri.parse('https://goo.gl/mwzkmmnrH93Vqrjg6');

  Future<void> _launchUrl({
    required Uri url,
  }) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        splashColor: Colors.amber[900],
        onPressed: () => Navigator.of(context).push(
          SwipeablePageRoute(
            builder: (context) => const GetVisit(
              hotelName: 'BullRing',
            ),
          ),
        ),
        backgroundColor: Colors.grey[900],
        label: Row(
          children: const [
            Icon(
              Icons.add,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Add Visits",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: newBackgroundColor,
        title: const Text(
          'BullRing FC',
          style: TextStyle(
            color: textColor,
            fontSize: 25,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    SizedBox(
                      height: 85,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white38,
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              if ((snapshot.data!.docs[index].id ==
                                  '${uid}BullRing')) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                      ),
                                    ],
                                    color: primaryColor,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: const Text(
                                          "Your visits",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: textColor,
                                          ),
                                        ),
                                        trailing: Text(
                                          '${snapshot.data!.docs[index].data()['visit']} ',
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 200,
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                          ),
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1486286701208-1d58e9338013?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.white;
                                    }
                                    return primaryColor;
                                  },
                                ),
                              ),
                              onPressed: () => _launchUrl(url: locationUrl),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Locate Us",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith(
                                  (states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return Colors.white;
                                    }
                                    return primaryColor;
                                  },
                                ),
                              ),
                              onPressed: () => _launchUrl(url: fbUrl),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.facebook_rounded,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Review Us",
                                    style: TextStyle(
                                      color: Colors.black,
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
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        SizedBox(
                          width: 100,
                          child: Divider(
                            thickness: 1.3,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "OFFERS FOR YOU",
                          style: TextStyle(
                            letterSpacing: 1.2,
                            color: textColor,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 100,
                          child: Divider(
                            thickness: 1.3,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            SwipeablePageRoute(
                              builder: (context) => const SelectVisits(
                                hotelName: 'BullRing',
                              ),
                            ),
                          ),
                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 40,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 1,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                "Visits offers",
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
