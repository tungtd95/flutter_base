import 'package:json_annotation/json_annotation.dart';

part 'candle.g.dart';

@JsonSerializable()
class Candle {
  @JsonKey(name: 'open_time')
  final dynamic openTime;
  @JsonKey(name: 'close_time')
  final dynamic closeTime;
  @JsonKey(name: 'open')
  final dynamic open;
  @JsonKey(name: 'high')
  final dynamic high;
  @JsonKey(name: 'low')
  final dynamic low;
  @JsonKey(name: 'close')
  final dynamic close;
  @JsonKey(name: 'quote_volume')
  final dynamic quoteVolume;
  @JsonKey(name: 'base_volume')
  final dynamic baseVolume;

  Candle({
    required this.openTime,
    required this.closeTime,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.quoteVolume,
    required this.baseVolume,
  });

  factory Candle.fromJson(Map<String, dynamic> json) =>
      _$CandleFromJson(json);

  Map<String, dynamic> toJson() => _$CandleToJson(this);
}
