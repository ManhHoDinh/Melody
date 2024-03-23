import 'package:flutter/material.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/presentations/screens/Discovery/item_screen.dart';
import 'package:melody/melody/presentations/screens/Discovery/widgets/music_item.dart';

import '../../../core/constants/color_palatte.dart';
import '../../../core/helper/assets_helper.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});
  static const String routeName = 'composer_screen';
  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xff6D0B14), Color(0xff4059F1)],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'Discovery',
            style: TextStyle(fontSize: 20).whiteTextColor,
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: ColorPalette.secondColor,
            ),
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff6D0B14), Color(0xff4059F1)],
              ),
            ),
            child: ListView(
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(),
                  child: Text(
                    'Melody',
                    style: TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Item 1',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Item 2',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
                controller: searchController,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                    filled: true,
                    hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    fillColor: Color.fromARGB(255, 254, 254, 254),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Search Song, Composer, Instrument',
                    prefixIconColor: Color.fromARGB(255, 0, 0, 0),
                    prefixIcon: Icon(Icons.search)),
              ),
              SizedBox(
                height: 20,
              ),
              MusicSection(
                title: 'Popular Songs',
                albums: albums,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: searchAlbums(albums, searchValue).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 6,
                  ),
                  itemBuilder: (context, index) {
                    return MusicItem(
                      music: searchAlbums(albums, searchValue)[index],
                    );
                  },
                ),
              ),
              MusicSection(
                title: 'New Release Songs',
                albums: albums,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: searchAlbums(albums, searchValue).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 6,
                  ),
                  itemBuilder: (context, index) {
                    return MusicItem(
                      music: searchAlbums(albums, searchValue)[index],
                    );
                  },
                ),
              ),
              MusicSection(
                title: 'Albums of the Month',
                albums: albums,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: searchAlbums(albums, searchValue).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 6,
                  ),
                  itemBuilder: (context, index) {
                    return MusicItem(
                      music: searchAlbums(albums, searchValue)[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Music> searchAlbums(List<Music> albums, String value) {
    return albums
        .where((element) =>
            element.name.contains(value) || element.artist.contains(value))
        .toList();
  }
}
