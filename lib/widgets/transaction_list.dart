import 'package:bitcoin_app/dummy.dart';
import 'package:bitcoin_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: transaction.length * 85,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: transaction.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var item = transaction[index];
          return TransactionItem(
            logo: item['bitcoin_logo'],
            type: item['transaction_type'],
            percent: item['percent'],
            value: item['transaction_value'],
          );
        },
      ),
    );
  }
}
