import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:melody/melody/core/models/playlist/playlist.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String Id,
    required String Name,
    required String Email,
    @Default([]) List<String> playlistIds,
    @Default("") String position,
    @Default([]) List<String> songIds,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}
