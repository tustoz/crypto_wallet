import 'package:flutter/material.dart';
import 'package:bitcoin_app/widgets/header.dart';
import 'package:bitcoin_app/widgets/section_title.dart';
import 'package:bitcoin_app/widgets/card_list.dart';
import 'package:bitcoin_app/widgets/buttons.dart';
import 'package:bitcoin_app/widgets/chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            Header(),
            SizedBox(height: 20),
            SectionTitle(title: 'My Cards'),
            SizedBox(height: 15),
            CardList(),
            SizedBox(height: 40),
            Buttons(),
            SizedBox(height: 30),
            SectionTitle(title: 'Activity'),
            SizedBox(height: 15),
            Chart(),
          ],
        ),
      ),
    );
  }
}
