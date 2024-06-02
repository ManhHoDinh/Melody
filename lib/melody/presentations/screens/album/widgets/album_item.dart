import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/helper/image_helper.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/firebase/album_request.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:melody/melody/presentations/screens/album/detail_album.dart';

class AlbumItem extends StatelessWidget {
  final Album album;
  const AlbumItem({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AlbumDetailScreen(album: album),
        ));
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                width: double.infinity,
                height: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ImageHelper.loadFromNetwork(album.image,
                        fit: BoxFit.fitWidth))),
            SizedBox(
              height: 10,
            ),
            Text(
              album.name,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
            ),
            SizedBox(
              height: 5,
            ),
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: AlbumRequest.getUserFromId(album.artist_id),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.data == null) {
                    return Text('No data found');
                  } else if (snapshot.hasData &&
                      snapshot.data!.data() != null) {
                    UserModel? user =
                        UserModel.fromJson(snapshot.data!.data()!);
                    return Text(
                      user.Name,
                      style: TextStyle(fontSize: 12),
                    );
                  }
                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}
