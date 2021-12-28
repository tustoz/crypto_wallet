import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bitcoin_app/constant.dart';
import 'package:bitcoin_app/widgets/bottom_navbar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark));
  runApp(const BitcoinApp());
}

class BitcoinApp extends StatelessWidget {
  const BitcoinApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bitcoin_app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFUIDisplay',
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const BottomNavbar(),
    );
  }
}
