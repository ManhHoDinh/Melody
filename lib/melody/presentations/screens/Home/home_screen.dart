import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/firebase/composer_request.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/perfomer/perfomer.dart';
import 'package:melody/melody/presentations/screens/Home/item_screen.dart';
import 'package:melody/melody/presentations/screens/Discovery/discovery_screen.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/composer_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/event_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/instrument_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/perfomer_item.dart';
import 'package:melody/melody/presentations/screens/playing/widgets/mini_playback.dart';
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
  //   // const Composer(
  //   //     music: 'Mozart', id: 1, name: 'Symphony', image: AssetHelper.imgArtist),
  //   // const Composer(
  //   //     music: 'Mozart', id: 1, name: 'Son tung', image: AssetHelper.imgArtist),
  //   // const Composer(
  //   //     music: 'Dinh Dai Duong',
  //   //     id: 1,
  //   //     name: 'Symphony ',
  //   //     image: AssetHelper.imgArtist),
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
  List<Event> event = [
    Event(
        startAt: DateTime.now(),
        id: "ff",
        name: 'Symphony',
        image: AssetHelper.imgArtist,
        location: 'New York',
        endAt: DateTime.now(),
        description: 'This is a symphony event'),
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
  void dispose() {
    print(_animationController);
    _animationController?.dispose();
    super.dispose();
  }

  @override
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
                          });
                        },
                        controller: searchController,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
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
                        albums: albums, // Pass your list of popular songs here
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            searchInstrument(instrument, searchValue).length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 5 / 6,
                        ),
                        itemBuilder: (context, index) {
                          return InstrumentItem(
                            instrument: searchInstrument(
                                instrument, searchValue)[index],
                          );
                        },
                      ),
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
                        title: 'Event',
                        albums: albums,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: ((context, index) {
                            return EventItem(
                              event: event[index],
                            );
                          }),
                          separatorBuilder: ((context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          }),
                          itemCount: event.length),
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
