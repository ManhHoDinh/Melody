import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/firebase/composer_request.dart';
import 'package:melody/melody/core/models/firebase/event_request.dart';
import 'package:melody/melody/core/models/firebase/instrument_request.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/perfomer/perfomer.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'package:melody/melody/core/models/user/user.dart';
import 'package:melody/melody/presentations/screens/Home/item_screen.dart';
import 'package:melody/melody/presentations/screens/Discovery/discovery_screen.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/composer_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/event_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/instrument_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/perfomer_item.dart';
import 'package:melody/melody/presentations/screens/event/all_event_screen.dart';
import 'package:melody/melody/presentations/screens/instrument/detail_instrument_screen.dart';
import 'package:melody/melody/presentations/screens/playing/widgets/mini_playback.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/song_item.dart';
import 'package:melody/melody/presentations/screens/chatbot/chatbot.dart';
import 'package:melody/melody/presentations/screens/playing/playing.dart';
import 'package:melody/melody/presentations/screens/playing/playlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:melody/melody/presentations/screens/music_recognition/music_recognition_screen.dart';
import '../../../core/models/instrumentModel/instrumentModel.dart';
import '../../../core/models/music/music.dart';
import 'widgets/music_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.animationController});
  static final String routeName = 'home_screen';
  final AnimationController? animationController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  ValueNotifier<List<Song>> recentSongsNotifier = ValueNotifier<List<Song>>([]);
  List<String> recentSearches = [];
  List<Song> recentSongs = [];
  late PlaylistProvider playlistProvider;
  List<Song>? songList;

  @override
  void initState() {
    super.initState();
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
    loadUserRecentSongs();
  }

  TextEditingController searchController = TextEditingController();
  String searchValue = '';
  List<Music> albums = [
    const Music(
        artist: 'Mozart',
        id: 1,
        name: 'Symphony',
        image: AssetHelper.imgArtist),
    const Music(
        artist: 'Mozart',
        id: 1,
        name: 'Son tung',
        image: AssetHelper.imgArtist),
    const Music(
        artist: 'Dinh Dai Duong',
        id: 1,
        name: 'Symphony ',
        image: AssetHelper.imgArtist),
  ];
  List<InstrumentModel> instrument = [
    const InstrumentModel(
        id: "1",
        name: 'Violet',
        image: AssetHelper.imgArtist,
        description: "ff"),
    const InstrumentModel(
        id: "1",
        name: 'Symphony ',
        image: AssetHelper.imgArtist,
        description: "ff"),
    const InstrumentModel(
        id: "1",
        name: 'Pinano',
        image: AssetHelper.imgArtist,
        description: "ff"),
  ];
  // List<Composer> composer = [

  // ];
  List<Perfomer> perfomer = [
    const Perfomer(
        music: 'Mozart', id: 1, name: 'Symphony', image: AssetHelper.imgArtist),
    const Perfomer(
        music: 'Mozart', id: 1, name: 'Son tung', image: AssetHelper.imgArtist),
    const Perfomer(
        music: 'Dinh Dai Duong',
        id: 1,
        name: 'Symphony ',
        image: AssetHelper.imgArtist),
  ];

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xffF7F7F7)),
      child: Scaffold(
        appBar: AppBar(
          title: RichText(
            text: const TextSpan(
              text: 'Ho',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D0B14)),
              children: <TextSpan>[
                TextSpan(
                  text: 'me',
                  style: TextStyle(fontSize: 20, color: Color(0xff4059F1)),
                ),
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatPage()),
                  );
                },
                icon: Icon(
                  Icons.message_sharp,
                  color: ColorPalette.secondColor,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            searchValue = value;
                            recentSearches.add(value);
                          });
                        },
                        controller: searchController,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 5),
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xffFFFFFF)),
                          fillColor: Color(0xff198FB4),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: 'Search Song, Composer, Instrument',
                          prefixIconColor: Color(0xffffffff),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                      SizedBox(height: 7),
                      MusicSection(
                        title: 'Recent Song',
                        albums: albums,
                      ),
                      recentSongs.isEmpty
                          ? Text('No recent songs')
                          : GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: recentSongs.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 5 / 6,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    _onSongTap(index);
                                  },
                                  child: SongItem(
                                    song: recentSongs[index],
                                  ),
                                );
                              },
                            ),
                      MusicSection(
                        title: 'Songs',
                        albums: albums,
                      ),
                      StreamBuilder<List<Song>>(
                        stream: SongRequest.getAll(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error loading composer list'),
                            );
                          } else {
                            songList = snapshot.data!;
                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  searchSong(songList!, searchValue).length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 5 / 6,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    _onSongTap(index);
                                    recentSongs.add(searchSong(
                                        songList!, searchValue)[index]);
                                  },
                                  child: SongItem(
                                    song: searchSong(
                                        songList!, searchValue)[index],
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                      SizedBox(height: 7),
                      MusicSection(
                        title: 'Composer',
                        albums: albums,
                      ),
                      StreamBuilder<List<Composer>>(
                        stream: ComposerRequest.getAll(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error loading composer list'),
                            );
                          } else {
                            List<Composer> composer = snapshot.data!;
                            return GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  searchComposer(composer, searchValue).length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 5 / 6,
                              ),
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/composerPage',
                                        arguments: composer[index].composerId);
                                  },
                                  child: ComposerItem(
                                    composer: searchComposer(
                                        composer, searchValue)[index],
                                  ),
                                );
                              },
                            );
                          }
                        },
                      ),
                      SizedBox(height: 7),
                      MusicSection(
                        title: 'Instrument',
                        albums: albums,
                      ),
                      StreamBuilder<List<InstrumentModel>>(
                          stream: InstrumentRequest.search(searchValue),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Center(
                                child: Text('Error loading composer list'),
                              );
                            } else
                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 5 / 6,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(() => DetailInstrumentScreen(
                                          instrument: snapshot.data![index]));
                                    },
                                    child: InstrumentItem(
                                      instrument: snapshot.data![index],
                                    ),
                                  );
                                },
                              );
                          }),
                      SizedBox(height: 7),
                      MusicSection(
                        title: 'Artist',
                        albums: albums,
                      ),
                      GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: perfomer.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 3 / 3,
                        ),
                        itemBuilder: (context, index) {
                          return PerfomerItem.PerformerItem(
                            perfomer: perfomer[index],
                          );
                        },
                      ),
                      MusicSection(
                        title: 'Events',
                        albums: albums,
                        viewMoreAction: () {
                          Get.to(() => AllEventScreen());
                        },
                      ),
                      StreamBuilder<List<Event>>(
                        stream: EventRequest.search(searchValue),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return ListView.separated(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: ((context, index) {
                                return EventItem(
                                  event: snapshot.data![index],
                                );
                              }),
                              separatorBuilder: ((context, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              }),
                              itemCount: snapshot.data!.length,
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: 70,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 70), child: MiniPlaybackBar()),
          ],
        ),
      ),
    );
  }

  List<InstrumentModel> searchInstrument(
      List<InstrumentModel> instrument, String value) {
    return instrument
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  List<Composer> searchComposer(List<Composer> composer, String value) {
    return composer
        .where((element) =>
            element.composerName.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  List<Song> searchSong(List<Song> Song, String value) {
    return Song.where((element) =>
        element.songName.toLowerCase().contains(value.toLowerCase())).toList();
  }

  // void addToRecentSearch(Song song) {
  //   setState(() {
  //     recentSongs.add(song);
  //   });
  // }

  void _onSongTap(int index) {
    print('Song at index $index was tapped');
    print('playlistProvider: $playlistProvider');
    print('songList: $songList');
    Song tappedSong = searchSong(songList!, searchValue)[index];
    setState(() {
      recentSongs.add(tappedSong);
    });
    addSongIdToUser(tappedSong.songId);
    if (playlistProvider != null && songList != null) {
      List<Song> copiedSongList = List.from(songList!);
      playlistProvider.playlist.clear();
      playlistProvider.setPlaylist(copiedSongList);
      print('playlist: ${playlistProvider.playlist}');
      playlistProvider.currentSongIndex = index;
      print('currentSongIndex: ${playlistProvider.currentSongIndex}');
      Navigator.of(context).pushNamed(Playing.routeName);
      recentSearches.add(copiedSongList[index] as String);
    }
  }

  void addSongIdToUser(String songId) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance.collection('Users').doc(userId).update({
      'songIds': FieldValue.arrayUnion([songId])
    });
  }

  Future<Song> getSongById(String songId) async {
    DocumentSnapshot songDoc =
        await FirebaseFirestore.instance.collection('Songs').doc(songId).get();
    return Song.fromJson(songDoc.data() as Map<String, dynamic>);
  }

  void loadUserRecentSongs() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('Users').doc(userId).get();
    UserModel user = UserModel.fromJson(userDoc.data() as Map<String, dynamic>);

    for (String songId in user.songIds) {
      Song song = await getSongById(songId);
      setState(() {
        recentSongs.add(song);
      });
    }
    recentSongs.sort((a, b) => a.times[0].compareTo(b.times[0]));
  }

  List<Event> searchEvents(List<Event> events, String value) {
    return events.where((element) => element.name.contains(value)).toList();
  }

  List<Perfomer> searchPerfomer(List<Perfomer> perfomer, String value) {
    return perfomer
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()) ||
            element.music.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
