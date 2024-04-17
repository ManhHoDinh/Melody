import 'package:flutter/material.dart';
import 'package:melody/melody/core/constants/color_palatte.dart';
import 'package:melody/melody/core/helper/assets_helper.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/composer/composer.dart';
import 'package:melody/melody/core/models/event/event.dart';
import 'package:melody/melody/core/models/firebase/composer_request.dart';
import 'package:melody/melody/core/models/firebase/event_request.dart';
import 'package:melody/melody/core/models/firebase/instrument_request.dart';
import 'package:melody/melody/core/models/firebase/perfomer_request.dart';
import 'package:melody/melody/core/models/instrument/instrument.dart';
// import 'package:melody/melody/core/models/instrument/instrument.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:get/get.dart';
import 'package:melody/melody/core/models/perfomer/perfomer.dart';
import 'package:melody/melody/presentations/screens/Home/item_screen.dart';
import 'package:melody/melody/presentations/screens/Discovery/discovery_screen.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/composer_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/event_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/instrument_item.dart';
// import 'package:melody/melody/presentations/screens/Home/widgets/instrument_item.dart';
import 'package:melody/melody/presentations/screens/Home/widgets/perfomer_item.dart';
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

  void _openDialog() {
    showDialog(
      context: context,
      builder: (context) => ListeningDialog(
        onSpeechEnd: (spokenText) {
          searchController.text = spokenText;
          searchValue = spokenText;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff6D0B14), Color(0xff4059F1)],
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Home',
              style: TextStyle(fontSize: 25).whiteTextColor,
            ),
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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xff6D0B14), Color(0xff4059F1)],
            ),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: 16, vertical: 16), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  suffixIcon: IconButton(
                    icon: Icon(Icons.mic),
                    onPressed: _openDialog,
                  ),
                ),
              ),
              SizedBox(height: 20),
              MusicSection(
                title: 'Instrument',
                albums: albums,
              ),
              SizedBox(height: 20),
              StreamBuilder<List<Instrument>>(
                stream: InstrumentRequest.search(searchValue),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 5 / 6,
                      ),
                      itemBuilder: ((context, index) {
                        return InstrumentItem(
                          instrument: snapshot.data![index],
                        );
                      }),
                    );
                  }
                }),
              ),
              SizedBox(height: 20),
              MusicSection(
                title: 'Composer',
                albums: albums,
              ),
              SizedBox(height: 20),
              StreamBuilder<List<Composer>>(
                stream: ComposerRequest.search(searchValue),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 5 / 6,
                      ),
                      itemBuilder: ((context, index) {
                        return ComposerItem(
                          composer: snapshot.data![index],
                        );
                      }),
                    );
                  }
                }),
              ),
              SizedBox(height: 20),
              MusicSection(
                title: 'Performer',
                albums: albums,
              ),
              SizedBox(height: 20),
              StreamBuilder<List<Perfomer>>(
                stream: PerfomerRequest.search(searchValue),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 5 / 6,
                      ),
                      itemBuilder: ((context, index) {
                        return PerfomerItem(
                          perfomer: snapshot.data![index],
                        );
                      }),
                    );
                  }
                }),
              ),
              SizedBox(height: 20),
              MusicSection(
                title: 'Event',
                albums: albums,
              ),
              SizedBox(height: 20),
              StreamBuilder<List<Event>>(
                stream: EventRequest.search(searchValue),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
            ],
          ),
        ),
      ),
    );
  }

  // List<Instrument> searchInstrument(List<Instrument> instrument, String value) {
  //   return instrument
  //       .where((element) =>
  //           element.name.toLowerCase().contains(value.toLowerCase()))
  //       .toList();
  // }

  List<Composer> searchComposer(List<Composer> composer, String value) {
    return composer
        .where((element) =>
            (element.name?.toLowerCase()?.contains(value.toLowerCase()) ??
                false) ||
            (element.music?.toLowerCase()?.contains(value.toLowerCase()) ??
                false))
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
