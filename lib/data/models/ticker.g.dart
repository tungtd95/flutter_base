// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      pairSymbol: json['pair_symbol'] as String,
      change24h: (json['change_24h'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      baseVolume24h: (json['base_volume_24h'] as num).toDouble(),
      quoteVolume24h: (json['quote_volume_24h'] as num).toDouble(),
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'pair_symbol': instance.pairSymbol,
      'change_24h': instance.change24h,
      'price': instance.price,
      'base_volume_24h': instance.baseVolume24h,
      'quote_volume_24h': instance.quoteVolume24h,
    };
