// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tafsir_rebar/utils/common_widgets.dart';
import 'package:tafsir_rebar/utils/styles.dart';
import 'package:tafsir_rebar/views/bookmark/model/bookmark_model.dart';
import 'package:tafsir_rebar/views/home/model/surah_model.dart';
import 'package:tafsir_rebar/views/home/widgets/surah_header_icons.dart';

class VerseCard extends StatelessWidget {
  final SurahModel surah;
  final int index;
  const VerseCard({
    Key? key,
    required this.surah,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SurahHeaderIcons(
          index: index,
          bookmarkModel: BookmarkModel(
            text: surah.array[index].ar,
            type: "surah",
            audio: surah.array[index].path,
          ),
        ),
        const SizedBox(height: 10),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              surah.array[index].ar,
              style: Styles.ayetArTextStyle(context),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            surah.array[index].en,
            textAlign: TextAlign.right,
            style: Styles.ayetEnTextStyle(context),
          ),
        ),
        const Divider(
          height: 13,
          thickness: 3,
          color: Color.fromARGB(255, 147, 141, 141),
          indent: 7,
          endIndent: 7,
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            surah.array[index].size,
            textAlign: TextAlign.right,
            style: Styles.ayetEnTextStyle(context),
          ),
        ),
        const SizedBox(height: 5),
        buildCustomDivider(),
      ],
    );
  }
}
