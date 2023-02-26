import 'package:chai/src/data/utils/global_var.dart';
import 'package:chai/src/presentation/enitty_tab/catagories/saloon.dart';
import 'package:chai/src/presentation/enitty_tab/catagories/sports.dart';
import 'package:chai/src/presentation/enitty_tab/catagories/super_market.dart';
import 'package:chai/src/presentation/home/screens/account.dart';
import 'package:chai/src/presentation/enitty_tab/catagories/food.dart';
import 'package:chai/src/presentation/home/screens/trending.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: newBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      SwipeablePageRoute(
                        builder: (context) => const TrendingPage(),
                      ),
                    ),
                    child: const CircleAvatar(
                      foregroundImage: AssetImage(
                        'lib/src/assets/trending.webp',
                      ),
                      radius: 25,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      SwipeablePageRoute(
                        builder: (context) => const Account(),
                      ),
                    ),
                    child: const CircleAvatar(
                      foregroundImage: AssetImage(
                        'lib/src/assets/chai_final.jpg',
                      ),
                      radius: 25,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome To Chai,",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    '${auth.currentUser!.displayName}',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 22,
                      color: textColor,
                    ),
                  ),
                ],
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
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "What we provide",
                style: TextStyle(
                  fontSize: 24,
                  color: textColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      SwipeablePageRoute(
                        builder: (context) => const FoodPage(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 3,
                            ),
                          ],
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Food',
                                  style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Melty Way',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  Text(
                                    'Happy Rolls',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      SwipeablePageRoute(
                        builder: (context) => const SuperMarketPage(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 3,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(24),
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Market',
                                  style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Better Life',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      SwipeablePageRoute(
                        builder: (context) => const SportsPage(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(5, 5),
                              blurRadius: 3,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(24),
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Sports',
                                  style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'BullRing FC',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(
                      SwipeablePageRoute(
                        builder: (context) => const SaloonPage(),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(5, 5),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(24),
                          color: primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25.0),
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Saloon',
                                  style: GoogleFonts.bebasNeue(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: Colors.black,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'StyleOn',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
