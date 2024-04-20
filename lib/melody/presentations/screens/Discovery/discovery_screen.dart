import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:melody/melody/core/helper/text_styles.dart';
import 'package:melody/melody/core/models/music/music.dart';
import 'package:melody/melody/presentations/screens/Discovery/item_screen.dart';
import 'package:melody/melody/presentations/screens/Discovery/widgets/music_item.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';
import '../../../core/constants/color_palatte.dart';
import '../../../core/helper/assets_helper.dart';

class DiscoveryScreen extends StatefulWidget {
  DiscoveryScreen({super.key, this.animationController});
  static const String routeName = 'composer_screen';
  AnimationController? animationController;
  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  TextEditingController searchController = TextEditingController();
  bool isTextFieldVisible = false;
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
          title: RichText(
            text: const TextSpan(
              text: 'Disc',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff6D0B14)),
              children: <TextSpan>[
                TextSpan(
                  text: 'very',
                  style: TextStyle(fontSize: 20, color: Color(0xff4059F1)),
                ),
              ],
            ),
          ),
          leading: IconButton(
            onPressed: () {
              setState(() {
                isTextFieldVisible = !isTextFieldVisible;
              });
            },
            icon: Icon(
              Icons.search,
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
              isTextFieldVisible
                  ? TextField(
                      onChanged: (value) {
                        setState(() {
                          searchValue = value;
                        });
                      },
                      controller: searchController,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle:
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        fillColor: Color.fromARGB(255, 254, 254, 254),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        hintText: 'Search Song, Composer, Instrument',
                        prefixIconColor: Color.fromARGB(255, 0, 0, 0),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.mic),
                          onPressed: _openDialog,
                        ),
                      ),
                    )
                  : Container(),
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
            element.name.toLowerCase().contains(value.toLowerCase()) ||
            element.artist.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}

class ListeningDialog extends StatefulWidget {
  final Function(String) onSpeechEnd;

  ListeningDialog({required this.onSpeechEnd});
  @override
  _ListeningDialogState createState() => _ListeningDialogState();
}

class _ListeningDialogState extends State<ListeningDialog> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _wordSpoken = '';

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  void initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    if (widget.onSpeechEnd != null) {
      widget.onSpeechEnd(_wordSpoken);
    }
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _wordSpoken = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Listening...'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _speechToText.isListening
                ? '$_wordSpoken'
                : _speechEnabled
                    ? 'Tap the microphone to start listening...'
                    : 'Speech not available',
          ),
          Expanded(
            child: Container(child: Text(_wordSpoken)),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
          onPressed:
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: "Listen",
        ),
      ],
    );
  }
}
