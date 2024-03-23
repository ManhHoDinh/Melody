import 'package:flutter/material.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:get/get.dart';
import 'package:melody/melody/presentations/screens/Home/item_screen.dart';
import 'package:melody/melody/presentations/screens/Discovery/discovery_screen.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/composer_item.dart';
import '../../../core/models/music/music.dart';
import 'widgets/music_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
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
  List<Composer> composer = [
    const Composer(
        music: 'Mozart', id: 1, name: 'Symphony', image: AssetHelper.imgArtist),
    const Composer(
        music: 'Mozart', id: 1, name: 'Son tung', image: AssetHelper.imgArtist),
    const Composer(
        music: 'Dinh Dai Duong',
        id: 1,
        name: 'Symphony ',
        image: AssetHelper.imgArtist),
  ];
  late AnimationController _animationController;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _topAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
          weight: 1,
        ),
      ],
    ).animate(_animationController);
    _bottomAlignmentAnimation = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomRight,
            end: Alignment.bottomLeft,
          ),
          weight: 1,
        ),
        TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft,
          ),
          weight: 1,
        ),
      ],
    ).animate(_animationController);
    _animationController.repeat();
  }

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
          title: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Home',
                style: TextStyle(fontSize: 25).whiteTextColor,
              ),
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
                  fillColor: Color(0xffFFFFFF),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search Song, Composer, Instrument',
                  prefixIconColor: Color.fromARGB(255, 0, 0, 0),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              MusicSection(
                title: 'Popular Songs',
                albums: albums, // Pass your list of popular songs here
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
                title: 'Composer',
                albums: albums, // Pass your list of popular songs here
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: searchComposer(composer, searchValue).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 6,
                  ),
                  itemBuilder: (context, index) {
                    return ComposerItem(
                      composer: searchComposer(composer, searchValue)[index],
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

  List<Composer> searchComposer(List<Composer> composer, String value) {
    return composer
        .where((element) =>
            element.name.contains(value) || element.music.contains(value))
        .toList();
  }
}
