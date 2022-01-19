import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(
        left: 36,
        top: 30,
        right: 30,
      ),
      color: kSecondaryColor,
      child: Column(
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: kSFUI16,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Maxi Aditya',
                      style: kName,
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/profile.png',
                  scale: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: Text(
                  'Your Current Worth',
                  style: kSFUI16.copyWith(
                    color: Colors.white30,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: Text(
                  r'$12,452.25',
                  style: kBalance,
                ),
              ),
              const SizedBox(height: 7),
              FadeInUp(
                duration: const Duration(milliseconds: 700),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/chevron-up.svg'),
                        const SizedBox(width: 5),
                        Text(
                          '+14,22%',
                          style: kPercent.copyWith(
                            color: kPercentUp,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 19),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/chevron-down.svg'),
                        const SizedBox(width: 5),
                        Text(
                          '-10.21%',
                          style: kPercent.copyWith(
                            color: kPercentDown,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
