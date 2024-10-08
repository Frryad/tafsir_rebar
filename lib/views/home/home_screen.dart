import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/utils/common_widgets.dart';
import 'package:tafsir_rebar/utils/constance.dart';
import 'package:tafsir_rebar/views/home/cubit/home_cubit.dart';
import 'package:tafsir_rebar/views/home/widgets/build_action.dart';
import 'package:tafsir_rebar/views/home/widgets/build_intro_text.dart';
import 'package:tafsir_rebar/views/home/widgets/build_title.dart';
import 'package:tafsir_rebar/views/home/widgets/list_view_of_surah.dart';
import 'package:tafsir_rebar/views/home/widgets/quran_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<HomeCubit>().homeScaffoldKey,
      appBar: AppBar(
        title: BuildTitle(
          isSearch: context.watch<HomeCubit>().isSearch,
          controller: context.read<HomeCubit>().searchedTextEditingController,
          runFilter: (searchedChar) =>
              context.read<HomeCubit>().runFilter(searchedChar),
        ),
        actions: [
          BuildAction(
            isSearch: context.watch<HomeCubit>().isSearch,
            clearSearched: () => context.read<HomeCubit>().clearSearched(),
            startSearched: () =>
                context.read<HomeCubit>().startSearched(context),
          )
        ],
        elevation: 0,
        leading: IconButton(
          onPressed: () => context
              .read<HomeCubit>()
              .homeScaffoldKey
              .currentState!
              .openDrawer(),
          icon: Image.asset(ImageAssets.menuIcon),
        ),
      ),
      drawer: buildCustomDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Constance.padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildIntroText(context),
              quranCard(),
              const SizedBox(height: 24),
              const ListViewOfSurah(),
            ],
          ),
        ),
      ),
    );
  }
}
