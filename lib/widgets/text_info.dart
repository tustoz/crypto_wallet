import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class TextInfo extends StatelessWidget {
  final String title;

  const TextInfo({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInUp(
        duration: const Duration(milliseconds: 900),
        child: Text(
          title,
          style: kInfo.copyWith(
            color: Colors.white30,
          ),
        ),
      ),
    );
  }
}
