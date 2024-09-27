import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tafsir_rebar/utils/app_router.dart';
import 'package:tafsir_rebar/utils/app_theme.dart';
import 'package:tafsir_rebar/views/azhkar/cubit/azhkar_cubit.dart';
import 'package:tafsir_rebar/views/bookmark/cubit/bookmark_cubit.dart';
import 'package:tafsir_rebar/views/bottom_navbar/cubit/bottom_navbar_cubit.dart';
import 'package:tafsir_rebar/views/home/cubit/home_cubit.dart';

import 'utils/app_string.dart';

class AppQuran extends StatelessWidget {
  const AppQuran({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(374, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavbarCubit>(
            create: (BuildContext context) => BottomNavbarCubit(),
          ),
          BlocProvider<HomeCubit>(
            create: (BuildContext context) => HomeCubit()..fetchSurahDataList(),
          ),
          BlocProvider<BookmarkCubit>(
            create: (BuildContext context) => BookmarkCubit()..getBookmarks(),
          ),
      
      
          BlocProvider<AzhkarCubit>(
            create: (BuildContext context) =>
                AzhkarCubit()..fetchAzhkarDataList(),
          ),
        ],
        child: GetMaterialApp(
          title: AppString.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: ThemeMode.light,
          initialRoute: Routes.initRoute,
          getPages: getPages,
          unknownRoute: unknownRoute(),

        ),
      ),
    );
  }
}
