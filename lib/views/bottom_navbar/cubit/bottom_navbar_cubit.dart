import 'package:tafsir_rebar/utils/app_string.dart';
import 'package:tafsir_rebar/utils/asset_manager.dart';
import 'package:tafsir_rebar/views/azhkar/azhkar_screen.dart';
import 'package:tafsir_rebar/views/bookmark/bookmark_screen.dart';
import 'package:tafsir_rebar/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

part 'bottom_navbar_state.dart';


class BottomNavbarCubit extends Cubit<BottomNavbarState> {
  BottomNavbarCubit() : super(BottomNavbarInitial());
  static BottomNavbarCubit get(context) => BlocProvider.of(context);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final GetStorage _box = GetStorage();
  final _key = "isDark";

  int currentIndex = 0;
  List<Widget> screens(context) => const [
        HomeScreen(),
        AzhkarScreen(),
        BookmarkScreen(),
      ];

  List<BottomNavigationBarItem> items() => [
        BottomNavigationBarItem(
          icon: Image.asset(
            (currentIndex == 0)
                ? ImageAssets.quranPurpleIcon
                : ImageAssets.quranGrayIcon,
          ),
          label: AppString.bottomNavigationBarItemQuranText,
        ),
      
        BottomNavigationBarItem(
          icon: Image.asset(
            (currentIndex == 1)
                ? ImageAssets.prayPurpleIcon
                : ImageAssets.prayGrayIcon,
          ),
          label: AppString.bottomNavigationBarItemPrayText,
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            (currentIndex == 2)
                ? ImageAssets.bookmarkPurpleIcon
                : ImageAssets.bookmarkGrayIcon,
          ),
          label: AppString.bottomNavigationBarItemBookmarkText,
        ),
      ];

  void changeBottomNavbar(int value) {
    currentIndex = value;
    emit(ChangeBottomNavbarState());
  }

  _saveThemeToBox(bool isDark) => _box.write(_key, isDark);

  bool _loadThemeFromBox() => _box.read<bool>(_key) ?? false;

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
  }
}
