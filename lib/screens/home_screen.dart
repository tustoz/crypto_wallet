import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:bitcoin_app/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoaded = false;
  List data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('lib/json/card.json');
    setState(() {
      data = jsonDecode(jsonText);
    });
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoaded = true;
      });
    });
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
                      'My Cards',
                      style: kSectionTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 180,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
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
                                    data[index]['card_logo'],
                                    scale: 4,
                                  ),
                                  const SizedBox(height: 30),
                                  Text(
                                    data[index]['card_number'],
                                    style: kCardNumber.copyWith(
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  const SizedBox(height: 22),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'CARD HOLDER',
                                            style: kCardHolder,
                                          ),
                                          Text(
                                            data[index]['card_holder'],
                                            style: kCardName,
                                          ),
                                        ],
                                      ),
                                      Image.asset(
                                        data[index]['card_type'],
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
                    },
                  ),
                ),
                const SizedBox(height: 38),
                Padding(
                  padding: const EdgeInsets.only(left: 36, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FadeInUp(
                        duration: const Duration(milliseconds: 1100),
                        child: SizedBox(
                          height: 53,
                          width: 160,
                          child: TextButton.icon(
                            label: const Text('Add Funds'),
                            icon: SvgPicture.asset('assets/icons/add.svg'),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              primary: kTextColor,
                              backgroundColor: kSecondaryColor,
                              textStyle: kSFUI16,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(9),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1100),
                        child: SizedBox(
                          height: 53,
                          width: 160,
                          child: TextButton.icon(
                            label: const Text('Transfer Funds'),
                            icon: SvgPicture.asset('assets/icons/send.svg'),
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              primary: kTextColor,
                              backgroundColor: kSecondaryColor,
                              textStyle: kSFUI16,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(9),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 33),
                Padding(
                  padding: const EdgeInsets.only(left: 36),
                  child: FadeInUp(
                    duration: const Duration(milliseconds: 1300),
                    child: Text(
                      'Activity',
                      style: kSectionTitle,
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SizedBox(
                    height: 250,
                    width: double.infinity,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: LineChart(
                        mainData(),
                        swapAnimationDuration:
                            const Duration(milliseconds: 800),
                        swapAnimationCurve: Curves.linear,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Color> gradientColors = [kGradientColorOne, kGradientColorTwo];

  LineChartData mainData() {
    return LineChartData(
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: true,
          horizontalInterval: 1.6,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              dashArray: const [3, 3],
              color: kGradientColorOne.withOpacity(0.2),
              strokeWidth: 2,
            );
          },
          drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          interval: 1,
          getTextStyles: (context, value) => TextStyle(
              color: kTextColor, fontWeight: FontWeight.bold, fontSize: 10),
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'Sun';
              case 2:
                return 'Mon';
              case 4:
                return 'Tue';
              case 6:
                return 'Wed';
              case 8:
                return 'Thu';
              case 10:
                return 'Fri';
              case 12:
                return 'Sat';
            }
            return '';
          },
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 25,
          margin: 12,
        ),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: _isLoaded
              ? [
                  const FlSpot(0, 3),
                  const FlSpot(2.4, 2),
                  const FlSpot(4.4, 3),
                  const FlSpot(6.4, 3.1),
                  const FlSpot(8, 4),
                  const FlSpot(9.5, 4),
                  const FlSpot(11, 5),
                ]
              : [
                  const FlSpot(0, 0),
                  const FlSpot(2.4, 0),
                  const FlSpot(4.4, 0),
                  const FlSpot(6.4, 0),
                  const FlSpot(8, 0),
                  const FlSpot(9.5, 0),
                  const FlSpot(11, 0)
                ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradientFrom: const Offset(0, 0),
            gradientTo: const Offset(0, 1),
            colors: [
              kGradientColorTwo.withOpacity(0.2),
              kGradientColorTwo.withOpacity(0.1),
            ],
          ),
        ),
      ],
    );
  }
}
