import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:bitcoin_app/constant.dart';


class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('lib/json/transaction.json');
    setState(() {
      data = jsonDecode(jsonText);
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 245,
                  width: MediaQuery.of(context).size.width,
                  color: kSecondaryColor,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 36,
                      top: 30,
                      right: 30,
                    ),
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
                                      SvgPicture.asset(
                                          'assets/icons/chevron-up.svg'),
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
                                      SvgPicture.asset(
                                          'assets/icons/chevron-down.svg'),
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
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    child: Text(
                      'Transactions',
                      style: kSectionTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 19),
                SizedBox(
                  height: data.length * 85,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          data[index]['bitcoin_logo'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index]['transaction_type'],
                                        style: kInfo.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        data[index]['percent'],
                                        style: kInfo.copyWith(
                                          color: Colors.white30,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 89),
                                  Text(
                                    data[index]['transaction_value'],
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
                    },
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 900),
                    child: Text(
                      'See all transaction details',
                      style: kInfo.copyWith(
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 23),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: Text(
                      'Cards',
                      style: kSectionTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 19),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                    bottom: 7,
                    left: 36,
                    right: 31,
                  ),
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1300),
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
                            SvgPicture.asset('assets/icons/visa.svg'),
                            const SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Visa Debit Card',
                                  style: kInfo.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '**** **** **** 2143',
                                  style: kInfo.copyWith(
                                    color: Colors.white30,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 89),
                            Text(
                              '\$142,25.14',
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
                ),
                const SizedBox(height: 26),
                Center(
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: Text(
                      'Swipe up for more',
                      style: kInfo.copyWith(
                        color: Colors.white30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
