import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'music.freezed.dart';
part 'music.g.dart';

@freezed
class Music with _$Music {
  const factory Music({
    required String name,
    required int id,
    required String artist,
    required String image,
  }) = _Music;

  factory Music.fromJson(Map<String, Object?> json) => _$MusicFromJson(json);
}
