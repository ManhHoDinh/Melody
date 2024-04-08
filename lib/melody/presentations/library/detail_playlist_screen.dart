import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/presentations/library/edit_playlist_screen.dart';
import 'package:melody/melody/presentations/widgets/appbar_widget.dart';

class DetailPlaylistScreen extends StatefulWidget {
  const DetailPlaylistScreen({super.key});

  @override
  State<DetailPlaylistScreen> createState() => _DetailPlaylistScreenState();
}

class _DetailPlaylistScreenState extends State<DetailPlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    String id = Get.arguments;
    return Scaffold(
      appBar: AppbarWidget(
        'Playlist',
      ),
      body: FutureBuilder<Playlist>(
          future: PlaylistRequest.getById(id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      snapshot.data!.image,
                                    )),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.name,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(snapshot.data!.description,
                                    style: TextStyle(fontSize: 16))
                              ],
                            ),
                          )
                        ]),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.play_circle,
                                  size: 60,
                                  color: ColorPalette.primaryColor,
                                )),
                            Text(
                              'Play All',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      size: 30,
                                      color: ColorPalette.primaryColor,
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Get.to(EditPlaylistScreen(),
                                          arguments: id);
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      size: 30,
                                      color: ColorPalette.primaryColor,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Track',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${snapshot.data!.songIds.length.toString()} tracks',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              );
            }
            return Container();
          }),
    );
  }
}
