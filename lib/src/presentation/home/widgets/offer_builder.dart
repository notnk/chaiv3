import 'package:chai/src/data/utils/global_var.dart';
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
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
              ),
            ],
            color: primaryColor,
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
              Column(
                children: [
                  ListTile(
                    leading: Text(
                      "${widget.snap['nameOffer']}",
                      style: const TextStyle(
                        color: textColor,
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
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${widget.snap['type']}",
                          style: const TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
