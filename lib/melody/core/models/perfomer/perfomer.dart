import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'perfomer.freezed.dart';
part 'perfomer.g.dart';

@freezed
class Perfomer with _$Perfomer {
  const factory Perfomer({
    required String name,
    required int id,
    required String music,
    required String image,
  }) = _Perfomer;

  factory Perfomer.fromJson(Map<String, Object?> json) =>
      _$PerfomerFromJson(json);
}
