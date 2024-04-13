import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'instrumentModel.freezed.dart';
part 'instrumentModel.g.dart';

@freezed
class InstrumentModel with _$InstrumentModel {
  const factory InstrumentModel({
    required String name,
    required String id,
    required String description,
    required String image,
  }) = _InstrumentModel;

  factory InstrumentModel.fromJson(Map<String, Object?> json) => _$InstrumentModelFromJson(json);
}
