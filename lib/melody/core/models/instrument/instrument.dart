import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'instrument.freezed.dart';
part 'instrument.g.dart';

@freezed
class Instrument with _$Instrument {
  const factory Instrument({
    required String name,
    required String id,
    required String description,
    required String image,
  }) = _Instrument;

  factory Instrument.fromJson(Map<String, Object?> json) => _$InstrumentFromJson(json);
}
