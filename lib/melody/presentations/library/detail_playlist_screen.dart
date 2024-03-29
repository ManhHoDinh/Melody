import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
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
                            child: Text(
                              snapshot.data!.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                          )
                        ]),
                  ],
                ),
              );
            }
            return Container();
          }),
    );
  }
}
