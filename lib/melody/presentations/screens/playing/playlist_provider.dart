import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:melody/melody/core/models/firebase/song_request.dart';
import 'package:melody/melody/core/models/song/song.dart';
import 'dart:math';

class PlaylistProvider extends ChangeNotifier {
  // playlist of songs
  List<Song> _playlist = [];

  List<Song> _originalPlaylist = [];

  int? _currentSongIndex;
  // Shuffle mode
  bool _isShuffle = false;

  // Repeat mode
  // RepeatMode _repeatMode = RepeatMode.none;
  bool _isRepeatOne = false;
  // Biến để lưu trữ thông tin của bài hát đang phát
  Song? _currentSong;
  bool isNearEnd = false;
  // AUDIO PLAYER

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    List<Song> copiedSongList = List.from(_playlist);
    _originalPlaylist.addAll(copiedSongList);
    listenToDuration();
  }

  // shuffle playlist
  void shufflePlaylist() {
    _playlist.clear();
    _playlist.addAll(List<Song>.from(_originalPlaylist)..shuffle());
    print(playlist[0].songName +
        "\n" +
        playlist[1].songName +
        "\n" +
        playlist[2].songName);
    notifyListeners();
  }

  // reset playlist
  void resetPlaylist() {
    _playlist.clear();
    _playlist.addAll(_originalPlaylist);
    notifyListeners();
  }

// Toggle shuffle
  void toggleShuffle() async {
    isShuffle = !isShuffle;
    if (isShuffle) {
      // Save the index of the current song
      int currentIndex = _currentSongIndex ?? 0;
      _currentSong = _originalPlaylist[currentIndex];
      pause();
      // Shuffle the playlist
      shufflePlaylist();
      _currentSongIndex = _playlist.indexOf(_currentSong!);
      print(_currentSongIndex);
      resume();
    } else {
      int currentIndex = _currentSongIndex ?? 0;
      _currentSong = _playlist[currentIndex];
      pause();
      resetPlaylist();
      _currentSongIndex = _playlist.indexOf(_currentSong!);
      print(_currentSongIndex);
      resume();
    }
    isShuffle
        ? Fluttertoast.showToast(msg: "Shuffle mode: ON")
        : Fluttertoast.showToast(msg: "Shuffle mode: OFF");
  }

  // Toggle repeat mode
  void toggleRepeat() {
    isRepeatOne = !isRepeatOne;
    print("Repeat one: " + isRepeatOne.toString());
    isRepeatOne
        ? Fluttertoast.showToast(msg: "Repeat mode: One")
        : Fluttertoast.showToast(msg: "Repeat mode: All");
  }

  // Method to play all songs from a specific index
  void playAllFromIndex(int startIndex) {
    currentSongIndex = startIndex;
    notifyListeners();
  }

  // initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(UrlSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // go to the next song if it's not the last song
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // if it's the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }

  // play previous song
  void playPreviousSong() async {
    // if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    }

    // if it's within first 2 seconds of the song, go to previous song
    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // if it's the first song, loop back to last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // listen to duration
  void listenToDuration() {
    // listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      if (newPosition.inSeconds - _currentDuration.inSeconds > 10) {
        isNearEnd = true;
      } else {
        isNearEnd = false;
      }
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      print(playlist[currentSongIndex!].songId);
      if (isNearEnd) {}
      SongRequest.updateCount(playlist[currentSongIndex!].songId);
      if (_isRepeatOne) {
        // if repeat mode is on, repeat the current song
        currentSongIndex = _currentSongIndex;
      } else {
        playNextSong();
      }
    });
  }

  // dispose audio player

  // Getters

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  AudioPlayer get audioPlayer => _audioPlayer;
  bool get isShuffle => _isShuffle;
  // RepeatMode get repeatMode => _repeatMode;
  bool get isRepeatOne => _isRepeatOne;

  // Setters

  set currentSongIndex(int? newIndex) {
    // update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // play the song at the new index
    }

    // update UI
    notifyListeners();
  }

  set isShuffle(bool value) {
    _isShuffle = value;
    notifyListeners();
  }

  set isRepeatOne(bool value) {
    _isRepeatOne = value;
    notifyListeners();
  }

  void setPlaylist(List<Song> newPlaylist) {
    _playlist = newPlaylist;
    List<Song> copiedSongList = List.from(newPlaylist);
    _originalPlaylist.clear();
    _originalPlaylist.addAll(copiedSongList);
    notifyListeners();
  }
}
