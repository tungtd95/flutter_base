// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

extension HomeDataCopyWith on HomeData {
  HomeData copyWith({
    Candle? btcCandle,
    List<City>? cities,
    String? remoteFlavor,
    Status? status,
    List<Ticker>? tickers,
    List<WeatherCity>? weathers,
  }) {
    return HomeData(
      btcCandle: btcCandle ?? this.btcCandle,
      cities: cities ?? this.cities,
      remoteFlavor: remoteFlavor ?? this.remoteFlavor,
      status: status ?? this.status,
      tickers: tickers ?? this.tickers,
      weathers: weathers ?? this.weathers,
    );
  }
}
