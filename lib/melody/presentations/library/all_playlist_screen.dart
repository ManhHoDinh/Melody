import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/firebase_helper.dart';
import 'package:melody/melody/core/models/firebase/playlist_request.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
import 'package:melody/melody/presentations/library/detail_playlist_screen.dart';
import 'package:melody/melody/presentations/library/widgets/playlist_item.dart';
import 'package:melody/melody/presentations/screens/instrument/detail_instrument_screen.dart';

class AllPlaylistScreen extends StatefulWidget {
  const AllPlaylistScreen({super.key});

  @override
  State<AllPlaylistScreen> createState() => _AllPlaylistScreenState();
}

class _AllPlaylistScreenState extends State<AllPlaylistScreen> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
          title: Text('Library'),
          actions: [
            IconButton(
                onPressed: () {
                  Get.bottomSheet(Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Color(0xffdcdcdc),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16))),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Name your playlist',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          TextField(
                            style: TextStyle(fontSize: 18),
                            controller: nameController,
                            decoration: InputDecoration(
                                hintText: 'Enter name of playlist'),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorPalette.primaryColor),
                              onPressed: () async {
                                String id =
                                    FirebaseHelper.playlistCollection.doc().id;
                                Playlist playlist = Playlist(
                                  name: nameController.value.text,
                                  id: id,
                                  image:
                                      "https://firebasestorage.googleapis.com/v0/b/melody-bf3aa.appspot.com/o/images%2Fdefault_playlist.png?alt=media&token=9912901b-1122-4e73-9046-ce6c1238abc8",
                                );
                                FirebaseHelper.playlistCollection
                                    .doc(id)
                                    .set(playlist.toJson());
                                Get.back();
                                nameController.clear();
                              },
                              child: Text('Create',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white)))
                        ],
                      ),
                    ),
                  ));
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: StreamBuilder<List<Playlist>>(
                    stream: PlaylistRequest.getAll(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return ListView.separated(
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DetailPlaylistScreen(
                                      playlist: snapshot.data![index]));
                                },
                                child: PlaylistItem(
                                  playlist: snapshot.data![index],
                                ),
                              );
                            }),
                            separatorBuilder: ((context, index) {
                              return SizedBox(
                                height: 16,
                              );
                            }),
                            itemCount: snapshot.data!.length);
                      return Container();
                    }),
              ),
            ),
          ],
        ));
  }
}
