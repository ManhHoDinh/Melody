import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'Instrument.freezed.dart';
part 'Instrument.g.dart';

@freezed
class Instrument with _$Instrument {
  const factory Instrument({
    required String name,
    required int id,
    required String image,
  }) = _Instrument;

  factory Instrument.fromJson(Map<String, Object?> json) => _$InstrumentFromJson(json);
}
