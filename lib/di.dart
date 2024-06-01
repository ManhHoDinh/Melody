import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:melody/melody/controller/playlist_controller.dart';
import 'package:melody/melody/controller/songController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // Sử dụng Get.lazyPut() thay vì Get.put()

    Get.lazyPut(() => SongController(), fenix: true);
    Get.lazyPut(() => PlaylistController(), fenix: true);
  }
}
