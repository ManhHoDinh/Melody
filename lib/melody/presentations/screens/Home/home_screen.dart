import 'package:flutter/material.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/perfomer/perfomer.dart';
import 'package:melody/melody/presentations/screens/Home/item_screen.dart';
import 'package:melody/melody/presentations/screens/Discovery/discovery_screen.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/composer_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/event_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/instrument_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/perfomer_item.dart';
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
            child: Text(
              'Home',
              style: TextStyle(fontSize: 25).whiteTextColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(DiscoveryScreen.routeName);
              },
              icon: Icon(
                Icons.account_circle,
                color: ColorPalette.secondColor,
                size: 40,
              ),
            ),
          ],
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
              SizedBox(height: 10),
              MusicSection(
                title: 'Instrument',
                albums: albums, // Pass your list of popular songs here
              ),
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: searchInstrument(instrument, searchValue).length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 6,
                  ),
                  itemBuilder: (context, index) {
                    return InstrumentItem(
                      instrument:
                          searchInstrument(instrument, searchValue)[index],
                    );
                  },
                ),
              ),
              MusicSection(
                title: 'Composer',
                albums: albums,
              ),
              Flexible(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
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
              MusicSection(
                title: 'Perfomer',
                albums: albums,
              ),
              Expanded(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: perfomer.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 5 / 6,
                  ),
                  itemBuilder: (context, index) {
                    return PerfomerItem.PerformerItem(
                      perfomer: perfomer[index],
                    );
                  },
                ),
              ),
              MusicSection(
                title: 'Event',
                albums: albums,
              ),
              Expanded(
                child: ListView.separated(
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
              )
            ],
          ),
        ),
      ),
    );
  }

  List<InstrumentModel> searchInstrument(List<InstrumentModel> instrument, String value) {
    return instrument
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  List<Composer> searchComposer(List<Composer> composer, String value) {
    return composer
        .where((element) =>
            element.name.toLowerCase().contains(value.toLowerCase()) ||
            element.music.toLowerCase().contains(value.toLowerCase()))
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
