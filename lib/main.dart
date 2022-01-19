import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bitcoin_app/constant.dart';
import 'package:bitcoin_app/widgets/bottom_bar.dart';

void main() {
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );

  runApp(const CryptoWallet());
}

class CryptoWallet extends StatelessWidget {
  const CryptoWallet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SFUIDisplay',
        scaffoldBackgroundColor: kPrimaryColor,
      ),
      home: const BottomBar(),
    );
  }
}
