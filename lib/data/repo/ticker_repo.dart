import 'package:flutter/foundation.dart';
import 'package:flutter_base/data/models/candle.dart';
import 'package:flutter_base/data/models/ticker.dart';
import 'package:flutter_base/data/utils/socket_io_utils.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart';

@singleton
class TickerRepo {
  final SocketIOHelper _socketIOHelper;
  final Socket _socketIO;
  late BehaviorSubject<List<Ticker>> _allTickerStream = BehaviorSubject();

  TickerRepo({
    required SocketIOHelper socketIOHelper,
    required Socket socketIO,
  })  : _socketIOHelper = socketIOHelper,
        _socketIO = socketIO {
    _socketIO.emit('join', 'ticker@all');
    _socketIO.on('24hTicker', (data) {
      print("${DateTime.now()} >>>>>>>>>>>>>>>> $runtimeType >> 24hTicker >> data = $data");
      List<Ticker> tickers = [];
      if (data is List<Map<String, dynamic>>) {
        data.forEach((element) {
          tickers.add(Ticker.fromJson(element));
        });
      }
      _allTickerStream.add(tickers);
    });

    // _socketIO.on('kline', (data) => null)
  }

  Stream<List<Ticker>> get allTickerStream {
    return _allTickerStream.stream;
  }

  // TODO: maybe replace by stream
  Stream<Candle> getCandle(String pair, {String interval = '1m', String? tag, bool createHandler = true}) {
    final subject = BehaviorSubject<Candle>();

    final String room = '$pair@kline_$interval';
    final String eventListen = 'kline';

    _socketIO.emit('join', room);

    if (createHandler) {
      final handler = (data) {
        debugPrint(
            '${DateTime.now()} >> ${tag ??
                runtimeType} >> get candle >> $pair - $interval >> $data');
        // if (data is Map<String, dynamic>) {
        //   final candle = Candle.fromJson(data);
        //   subject.add(candle);
        // }
      };
      _socketIO.on(eventListen, handler);
    }

    return subject.stream.doOnCancel(() {
      // _socketIO.off(eventListen, handler);
      // _socketIO.emit('leave', room);
    });
  }
}
