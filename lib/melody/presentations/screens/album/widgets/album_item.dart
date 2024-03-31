import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/album/album.dart';
import 'package:melody/melody/core/models/firebase/album_request.dart';
import 'package:melody/melody/core/models/user/user.dart';

class AlbumItem extends StatelessWidget {
  final Album album;
  const AlbumItem({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.fitWidth, image: NetworkImage(album.image))),
            ),
          ),
          Text(
            album.name,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
          ),
          FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: AlbumRequest.getUserFromId(album.artist_id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No data found');
                }
                if (snapshot.hasData) {
                  UserModel user = UserModel.fromJson(snapshot.data!.data()!);
                  return Text(
                    user.Name,
                    style: TextStyle(fontSize: 12, color: Color(0xffe7e7e9)),
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }
}