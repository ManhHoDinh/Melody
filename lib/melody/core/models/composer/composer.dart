import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'composer.freezed.dart';
part 'composer.g.dart';

@freezed
class Composer with _$Composer {
  const factory Composer({
    required String composerId,
    required String composerName,
    required String about,
    required String portrait,
  }) = _Composer;

  factory Composer.fromJson(Map<String, Object?> json) =>
      _$ComposerFromJson(json);
}
