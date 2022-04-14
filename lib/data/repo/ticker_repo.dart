import 'package:flutter_base/data/models/candle.dart';
import 'package:flutter_base/data/models/ticker.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:socket_io_client/socket_io_client.dart';

@singleton
class TickerRepo {
  final Socket _socketIO;
  BehaviorSubject<List<Ticker>> _allTickerStream = BehaviorSubject();
  Map<String, BehaviorSubject<Candle>> _pairCandle = {};
  Map<String, int> _roomCandleJoint = {};

  TickerRepo({
    required Socket socketIO,
  })  : _socketIO = socketIO {
    _socketIO.onConnect((_) {
      print('$runtimeType socketIO connected');
      print('$runtimeType socketIO reconnecting if needed');
      _socketIO.emit('join', 'ticker@all');
      print("WTF on reconnect: ${_roomCandleJoint}");
      _roomCandleJoint.keys.forEach((element) {
        if ((_roomCandleJoint[element] ?? 0) > 0) {
          _socketIO.emit('join', element);
        }
      });
    });
    _socketIO.emit('join', 'ticker@all');
    _socketIO.on('24hTicker', (data) {
      // print(
      //     "${DateTime.now()} >>>>>>>>>>>>>>>> $runtimeType >> 24hTicker >> data = $data");
      List<Ticker> tickers = [];
      if (data is List<Map<String, dynamic>>) {
        data.forEach((element) {
          tickers.add(Ticker.fromJson(element));
        });
      }
      _allTickerStream.add(tickers);
    });

    _socketIO.on('kline', (data) {
      // debugPrint('${DateTime.now()} >> runtimeType >> kline event >> $data');
      final candle = Candle.fromJson(data);
      // TODO: this logic is just for testing, will be replaced with the corrected one
      if (candle.open == "420") {
        _pairCandle['BTCBUSD']?.add(candle);
      } else if (candle.open == '5') {
        _pairCandle['CHIENBUSD']?.add(candle);
      } else if (candle.open == "0") {
        _pairCandle['CAKEBUSD']?.add(candle);
      }
    });
  }

  Stream<List<Ticker>> get allTickerStream {
    return _allTickerStream.stream;
  }

  Stream<Candle> getCandle(
    String pair, {
    String interval = '1m',
  }) {
    final String room = '$pair@kline_$interval';
    _socketIO.emit('join', room);
    BehaviorSubject<Candle>? subject = _pairCandle[pair];
    if (subject == null) {
      subject = BehaviorSubject();
      _pairCandle[pair] = subject;
    }
    int currentListenerInRoom = _roomCandleJoint[room] ?? 0;
    _roomCandleJoint[room] = currentListenerInRoom + 1;
    print("WTF $pair joint ${_roomCandleJoint}");
    return subject.stream.doOnCancel(() {
      int currentListenerInRoom = _roomCandleJoint[room] ?? 0;
      if (currentListenerInRoom > 0) {
        _roomCandleJoint[room] = currentListenerInRoom - 1;
      }
      if ((_roomCandleJoint[room] ?? 0) == 0) {
        _socketIO.emit('leave', room);
      }
      print("WTF $pair on cancel ${_roomCandleJoint}");
    });
  }
}
