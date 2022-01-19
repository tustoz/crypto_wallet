import 'package:bitcoin_app/widgets/card_item.dart';
import 'package:flutter/material.dart';

import '../dummy.dart';

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: card.length,
        itemBuilder: (context, index) {
          var item = card[index];

          return CardItem(
            logo: item['card_logo'],
            number: item['card_number'],
            holder: item['card_holder'],
            type: item['card_type'],
          );
        },
      ),
    );
  }
}
