import 'package:animate_do/animate_do.dart';
import 'package:tafsir_rebar/utils/common_widgets.dart';
import 'package:tafsir_rebar/views/hadith/cubit/hadith_cubit.dart';
import 'package:tafsir_rebar/views/hadith/widgets/hadith_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HadithScreenListView extends StatelessWidget {
  const HadithScreenListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HadithCubit, HadithState>(
      builder: (context, state) {
        var cubit = HadithCubit.get(context); //(state is FetchHadithsLoading)

        return (state is FetchHadithLoading)
            ? buildLoading(context)
            : (cubit.searchedList.isEmpty)
                ? buildEmptyList(context)
                : (state is LoadingAll)
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 16),
                              itemCount: cubit.searchedList.length,
                              itemBuilder: (context, index) {
                                var hadith = cubit.searchedList[index];
                                return (index % 2 == 0)
                                    ? FadeInLeftBig(
                                        duration:
                                            const Duration(milliseconds: 1200),
                                        child: buildHadithCard(
                                          index,
                                          hadith,
                                        ),
                                      )
                                    : FadeInRightBig(
                                        duration:
                                            const Duration(milliseconds: 1200),
                                        child: buildHadithCard(
                                          index,
                                          hadith,
                                        ),
                                      );
                              }),
                        ),
                      )
                    : const SizedBox(
                        child: Text("SizeBox"),
                      );
      },
    );
  }
}
