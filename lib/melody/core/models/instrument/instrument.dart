import 'package:freezed_annotation/freezed_annotation.dart';
part 'instrument.g.dart';
part 'instrument.freezed.dart';

@Freezed()
class Instrument with _$Instrument {
  const factory Instrument({
    required String name,
    required String id,
    required String description,
    required String image,
  }) = _Instrument;
  factory Instrument.fromJson(Map<String, dynamic> json) =>
      _$InstrumentFromJson(json);
}