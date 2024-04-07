import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'composer.freezed.dart';
part 'composer.g.dart';

@Freezed()
class Composer with _$Composer {
  const factory Composer({
    required String name,
    required String id,
    required String music,
    required String image,
  }) = _Composer;

  factory Composer.fromJson(Map<String, dynamic?> json) =>
      _$ComposerFromJson(json);
}
