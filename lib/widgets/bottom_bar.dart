import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:bitcoin_app/screens/home_screen.dart';
import 'package:bitcoin_app/screens/transaction_screen.dart';
import 'package:bitcoin_app/constant.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final List _page = [const HomeScreen(), const TransactionScreen()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
              ),
            ),
            SizedBox(
              height: 50,
              width: 133,
              child: TextButton(
                child: const Text('Pay Now'),
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
            IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              icon: SvgPicture.asset(
                'assets/icons/wallet.svg',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
