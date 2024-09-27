import 'package:animate_do/animate_do.dart';
import 'package:tafsir_rebar/utils/app_string.dart';
import 'package:tafsir_rebar/utils/styles.dart';
import 'package:flutter/material.dart';


Widget buildIntroText(context) {
  return FadeInLeft(
    duration: const Duration(milliseconds: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppString.asslamualaikum,
          style: Styles.asslamualaikumTextStyle,
        ),
        const SizedBox(height: 4),
        Text(
          AppString.tanvirAhassan,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ],
    ),
  );
}
