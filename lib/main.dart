import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:melody/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melody/melody/core/helper/local_storage_helper.dart';
import 'package:melody/melody/presentations/routes/app_router.dart';
import 'package:melody/melody/presentations/screens/album/all_album.dart';
import 'package:melody/melody/presentations/screens/event/all_event_screen.dart';
import 'package:melody/melody/main.dart';
import 'package:melody/melody/presentations/screens/splash/splash_screen.dart';
import 'navigation_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get/get.dart';
import 'melody/core/models/firebase/firebase_request.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //add
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();
  WidgetsFlutterBinding.ensureInitialized();
  await FireBaseDataBase.initializeDB();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      initialRoute: Routes.allEvent,
      home: melodyApp(),
      getPages: [
        GetPage(name: Routes.allAlbum, page: () => AllAlbumScreen()),
        GetPage(name: Routes.allEvent, page: () => AllEventScreen()),
      ],
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
