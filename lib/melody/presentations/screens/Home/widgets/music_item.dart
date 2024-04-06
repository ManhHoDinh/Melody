import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/models/firebase/music_request.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/core/models/user/user.dart';

class MusicItem extends StatelessWidget {
  
  final Music music;
  const MusicItem({super.key, required this.music});

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
                      fit: BoxFit.fitWidth, image: AssetImage(music.image))),
            ),
          ),
          Text(
            music.name,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 14, color: Colors.white),
          ),
          Text(
            music.artist,
            style: TextStyle(fontSize: 12, color: Color(0xffe7e7e9)),
          ),
           FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              future: MusicRequest.getUserFromId(music.id.toString()),
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