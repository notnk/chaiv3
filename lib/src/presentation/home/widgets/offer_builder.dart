import 'package:flutter/material.dart';

class OfferBuilder extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final snap;
  const OfferBuilder({super.key, this.snap});

  @override
  State<OfferBuilder> createState() => _OfferBuilderState();
}

class _OfferBuilderState extends State<OfferBuilder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        InkWell(
          // onTap: () => Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => const HappyRolls(),
          //   ),
          // ),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              color: Colors.grey[900],
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 0,
                  ),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        '${widget.snap['image']}',
                      ),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Text(
                          "${widget.snap['nameOffer']}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          width: 47,
                          height: 23,
                          child: const Text(
                            "New",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.snap['nameHotel']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${widget.snap['type']}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
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
      ],
    );
  }
}
