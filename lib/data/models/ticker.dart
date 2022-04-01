import 'package:json_annotation/json_annotation.dart';

part 'ticker.g.dart';

@JsonSerializable()
class Ticker {
  @JsonKey(name: 'pair_symbol')
  final String pairSymbol;
  @JsonKey(name: 'change_24h')
  final double change24h;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'base_volume_24h')
  final double baseVolume24h;
  @JsonKey(name: 'quote_volume_24h')
  final double quoteVolume24h;

  Ticker({
    required this.pairSymbol,
    required this.change24h,
    required this.price,
    required this.baseVolume24h,
    required this.quoteVolume24h,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) =>
      _$TickerFromJson(json);

  Map<String, dynamic> toJson() => _$TickerToJson(this);
}
