import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class ExternalWallet {
  late WalletConnect _connector;
  late BehaviorSubject<ExternalWalletData> dataSubject;
  SessionStatus? _sessionStatus;

  PeerMeta? get peerMeta => _connector.session.peerMeta;

  List<String> get accounts => _connector.session.accounts;

  WalletConnectSession get session => _connector.session;

  ExternalWallet() {
    dataSubject = BehaviorSubject.seeded(
      ExternalWalletData(walletId: hashCode),
    );
  }

  Future<SessionStatus?> createNewSession(Function(String) onDisplayUri) async {
    _connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'PositionExchange',
        description: 'The Next-Gen Decentralized Trading Protocol',
        url: 'https://position.exchange',
        icons: ['https://position.exchange/favicon.ico'],
      ),
    );
    _subscribeWalletEvent();
    _sessionStatus = await _connector.connect(
      chainId: 56,
      onDisplayUri: onDisplayUri,
    );
    return _sessionStatus;
  }

  Future<SessionStatus?> reconnectSession(WalletConnectSession session) async {
    _connector = WalletConnect(session: session);
    _subscribeWalletEvent();
    _sessionStatus = await _connector.connect(chainId: 56);
    return _sessionStatus;
  }

  void _subscribeWalletEvent() {
    _connector.on(
      'connect',
      (session) {
        debugPrint('EW $hashCode connect $session');
        dataSubject.add(
          ExternalWalletData(
            status: ExternalWalletStatus.CONNECTED,
            walletId: hashCode,
          ),
        );
      },
    );
    _connector.on(
      'session_update',
      (payload) {
        debugPrint('EW $hashCode session_update $payload');
        dataSubject.add(
          ExternalWalletData(
            status: ExternalWalletStatus.SESSION_UPDATE,
            walletId: hashCode,
          ),
        );
      },
    );
    _connector.on(
      'disconnect',
      (session) {
        debugPrint('EW $hashCode disconnect $session');
        dataSubject.add(
          ExternalWalletData(
            status: ExternalWalletStatus.DISCONNECTED,
            walletId: hashCode,
          ),
        );
      },
    );
  }

  void closeSocket() {
    _connector.transport.close();
  }
}

class ExternalWalletData {
  ExternalWalletStatus status;
  int walletId;

  ExternalWalletData({
    this.status = ExternalWalletStatus.INIT,
    required this.walletId,
  });
}

enum ExternalWalletStatus {
  INIT,
  CONNECTED,
  SESSION_UPDATE,
  DISCONNECTED,
}
