import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36),
      child: FadeInUp(
        duration: const Duration(milliseconds: 900),
        child: Text(
          title,
          style: kSectionTitle,
        ),
      ),
    );
  }
}
