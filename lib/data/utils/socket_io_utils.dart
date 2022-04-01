import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';

@singleton
class SocketIOHelper {
  late Socket _socketIO;

  SocketIOHelper({required Socket socket}) : _socketIO = socket {
    _configSocket();
  }
  
  void _configSocket() {
    _socketIO.onConnect((_) {
      print('$runtimeType socketIO connected');

      print('$runtimeType socketIO reconnecting if needed');
      if (_socketIO.hasListeners('24hTicker')) {
        _socketIO.emit('join', 'ticker@all');
      }
    });
    _socketIO.onDisconnect((data) {
      print('$runtimeType socketIO onDisconnect');
    });
    _socketIO.onReconnecting((data) {
      print('$runtimeType socketIO onReconnecting');
    });
    _socketIO.onError((data) {
      print('$runtimeType socketIO onError: $data');
    });
    _socketIO.onConnectError((data) {
      print('$runtimeType socketIO onConnectError: $data');
    });
  }
}
