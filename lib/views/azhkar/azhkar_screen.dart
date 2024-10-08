import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/utils/common_widgets.dart';
import 'package:tafsir_rebar/views/azhkar/cubit/azhkar_cubit.dart';
import 'package:tafsir_rebar/views/azhkar/widgets/azhkar_screen_list_view.dart';
import 'package:tafsir_rebar/views/home/widgets/build_action.dart';
import 'package:tafsir_rebar/views/home/widgets/build_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AzhkarScreen extends StatefulWidget {
  const AzhkarScreen({super.key});

  @override
  State<AzhkarScreen> createState() => _AzhkarScreenState();
}

class _AzhkarScreenState extends State<AzhkarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<AzhkarCubit>().azhkarScaffoldKey,
      appBar: AppBar(
        title: BuildTitle(
          isSearch: context.watch<AzhkarCubit>().isSearch,
          controller: context.read<AzhkarCubit>().searchedTextEditingController,
          runFilter: (searchedChar) =>
              context.read<AzhkarCubit>().runFilter(searchedChar),
        ),
        actions: [
          BuildAction(
            isSearch: context.watch<AzhkarCubit>().isSearch,
            clearSearched: () => context.read<AzhkarCubit>().clearSearched(),
            startSearched: () =>
                context.read<AzhkarCubit>().startSearched(context),
          )
        ],
        elevation: 0,
        leading: IconButton(
          onPressed: () => context
              .read<AzhkarCubit>()
              .azhkarScaffoldKey
              .currentState!
              .openDrawer(),
          icon: Image.asset(ImageAssets.menuIcon),
        ),
      ),
      drawer: buildCustomDrawer(context),
      body: const AzhkarScreenListView(),
    );
  }
}
