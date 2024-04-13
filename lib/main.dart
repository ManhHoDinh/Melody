import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:melody/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:melody/melody/core/helper/local_storage_helper.dart';
import 'package:melody/melody/core/models/artist/artist.dart';
import 'package:melody/melody/core/models/firebase/artist_request.dart';
import 'package:melody/melody/presentations/screens/account/login_screen.dart';
import 'package:melody/melody/presentations/screens/account/sign_up_screen.dart';
import 'package:melody/melody/presentations/screens/artist/artist_page.dart';
import 'package:melody/melody/presentations/screens/artist/edit_artist_profile.dart';
import 'package:melody/melody/presentations/screens/artist/edit_song.dart';
import 'package:melody/melody/presentations/screens/artist/upload_song_page.dart';
import 'package:melody/melody/presentations/screens/playing/playing.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:melody/melody/presentations/screens/queue/queue.dart';
import 'package:melody/melody/presentations/screens/album/all_album.dart';
import 'package:melody/melody/presentations/screens/event/all_event_screen.dart';
import 'package:melody/melody/main.dart';
import 'package:melody/melody/presentations/routes/app_router.dart';
import 'package:melody/melody/presentations/screens/Discovery/discovery_screen.dart';
import 'package:melody/melody/presentations/screens/Home/home_screen.dart';
import 'package:melody/melody/presentations/screens/instrument/create_instrument_screen.dart';
import 'package:melody/melody/presentations/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'melody/presentations/screens/playing/playlist_provider.dart';
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
  ]).then((_) => runApp(ChangeNotifierProvider(
        create: (context) => PlaylistProvider(),
        child: MyApp(),
      )));
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
        platform: TargetPlatform.iOS,
      ),
      // initialRoute: Routes.createInstrument,
      home: melodyApp(),

      getPages: [
        GetPage(name: Routes.allAlbum, page: () => AllAlbumScreen()),
        GetPage(name: Routes.allEvent, page: () => AllEventScreen()),
        GetPage(
            name: Routes.createInstrument,
            page: () => CreateInstrumentScreen()),
        GetPage(name: Routes.uploadSong, page: () => UploadSongPage()),
        GetPage(name: Routes.artistPage, page: () => ArtistPage()),
        GetPage(name: Routes.editArtist, page: () => EditArtist()),
        GetPage(name: Routes.playing, page: () => Playing()),
        GetPage(name: Routes.queue, page: () => Queue()),
        GetPage(name: Routes.editSong, page: () => EditSong()),
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
