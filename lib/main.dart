import 'package:tafsir_rebar/app.dart';
import 'package:tafsir_rebar/bloc_observer.dart';
import 'package:tafsir_rebar/helper/bookmark_service.dart';
import 'package:tafsir_rebar/views/bookmark/model/bookmark_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await Hive.initFlutter();
  Hive.registerAdapter(BookmarkModelAdapter());
  await BookmarkService.initialize();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const AppQuran()));

}
