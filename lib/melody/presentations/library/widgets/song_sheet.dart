import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:melody/melody/controller/songController.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/presentations/library/widgets/song_item.dart';

class SongSheet extends StatefulWidget {
  final String playlistId;
  const SongSheet({super.key, required this.playlistId});

  @override
  State<SongSheet> createState() => _SongSheetState();
}

class _SongSheetState extends State<SongSheet> {
  SongController songController = Get.find();

  @override
  Widget build(BuildContext context) {
    songController.resetDisplaySongs(widget.playlistId);
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                  child: Center(
                      child: Text('Edit Quantity',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18)))),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: ColorPalette.grayText,
                  ))
            ],
          ),
          SizedBox(height: 20),
          Obx(() {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SongItem(
                          playlistId: widget.playlistId,
                          item: songController.displayedSongs[index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: songController.displayedSongs.length));
          }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
