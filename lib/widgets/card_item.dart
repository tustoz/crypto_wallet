import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class CardItem extends StatelessWidget {
  final String logo;
  final String holder;
  final String number;
  final String type;

  const CardItem(
      {Key? key,
      required this.logo,
      required this.number,
      required this.holder,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 5.5),
      child: FadeInUp(
        duration: const Duration(milliseconds: 900),
        child: Container(
          height: 180,
          width: 296,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  logo,
                  scale: 4,
                ),
                const SizedBox(height: 30),
                Text(
                  number,
                  style: kCardNumber.copyWith(
                    fontFamily: 'Inter',
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: kCardHolder,
                        ),
                        Text(
                          holder,
                          style: kCardName,
                        ),
                      ],
                    ),
                    Image.asset(
                      type,
                      scale: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
