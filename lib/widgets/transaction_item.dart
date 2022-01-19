import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';

class TransactionItem extends StatelessWidget {
  final String logo;
  final String type;
  final String percent;
  final String value;

  const TransactionItem({
    Key? key,
    required this.logo,
    required this.type,
    required this.percent,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 7,
        left: 36,
        right: 31,
      ),
      child: FadeInUp(
        duration: const Duration(milliseconds: 900),
        child: Container(
          height: 69,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [kLinearOne, kLinearTwo],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 11,
                        vertical: 9,
                      ),
                      child: SvgPicture.asset(
                        logo,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
                      style: kInfo.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      percent,
                      style: kInfo.copyWith(
                        color: Colors.white30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 89),
                Text(
                  value,
                  style: kInfo.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
