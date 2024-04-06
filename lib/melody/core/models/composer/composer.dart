import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'composer.freezed.dart';
part 'composer.g.dart';

@freezed
class Composer with _$Composer {
  const factory Composer({
    required String name,
    required String id,
    required String music,
    required String image,
  }) = _Composer;

  factory Composer.fromJson(Map<String, Object?> json) =>
      _$ComposerFromJson(json);
}
