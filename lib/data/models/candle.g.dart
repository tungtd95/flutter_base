// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candle _$CandleFromJson(Map<String, dynamic> json) => Candle(
      openTime: json['open_time'],
      closeTime: json['close_time'],
      open: json['open'],
      high: json['high'],
      low: json['low'],
      close: json['close'],
      quoteVolume: json['quote_volume'],
      baseVolume: json['base_volume'],
    );

Map<String, dynamic> _$CandleToJson(Candle instance) => <String, dynamic>{
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'quote_volume': instance.quoteVolume,
      'base_volume': instance.baseVolume,
    };
