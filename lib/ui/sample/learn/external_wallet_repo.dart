import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_base/ui/sample/learn/external_wallet.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

class ExternalWalletRepo {
  List<ExternalWallet> _wallets = [];
  BehaviorSubject<List<ExternalWallet>> walletsSubject =
      BehaviorSubject.seeded([]);

  // local secure storage
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  String _keyWallets = 'KEY_WALLETS';

  ExternalWalletRepo() {
    _reviveSavedWallet();
  }

  void createNewWallet(Function(String) onDisplayUri) async {
    final wallet = ExternalWallet();
    SessionStatus? sessionStatus = await wallet.createNewSession(onDisplayUri);
    if (sessionStatus != null) {
      _wallets.add(wallet);
      wallet.dataSubject.stream.listen(_handleWalletEvent);
      _notify();
    }
  }

  void _reviveSavedWallet() async {
    try {
      String data = await _secureStorage.read(key: _keyWallets) ?? '';
      List<dynamic> dataJson = jsonDecode(data) as List<dynamic>;
      List<ExternalWallet> wallets = [];
      for (var i = 0; i < dataJson.length; i++) {
        WalletConnectSession session =
            WalletConnectSession.fromJson(dataJson[i]);
        ExternalWallet wallet = ExternalWallet();
        SessionStatus? status = await wallet.reconnectSession(session);
        if (status != null) {
          wallets.add(wallet);
          wallet.dataSubject.stream.listen(_handleWalletEvent);
        }
      }
      _wallets = wallets;
      _notify(save: false);
    } on Exception catch (e) {
      debugPrint('$runtimeType error $e');
      await _secureStorage.delete(key: _keyWallets);
    }
  }

  void reconnectNetwork() {
    _wallets.forEach((element) {
      element.reconnect();
    });
  }

  void _handleWalletEvent(ExternalWalletData data) {
    switch (data.status) {
      case ExternalWalletStatus.DISCONNECTED:
        List<ExternalWallet> newWallets = [];
        _wallets.forEach((element) {
          if (element.hashCode != data.walletId) {
            newWallets.add(element);
          }
        });
        _wallets = newWallets;
        _notify();
        break;
      case ExternalWalletStatus.SESSION_UPDATE:
        _notify();
        break;
      default:
      // Do nothing
    }
  }

  void _notify({bool save = true}) {
    walletsSubject.add(List.from(_wallets));
    if (save) {
      _saveWalletsToStorage();
    }
  }

  void _saveWalletsToStorage() {
    List<Map<String, dynamic>> data = [];
    _wallets.forEach((wallet) {
      data.add(wallet.session.toJson());
    });
    _secureStorage.write(key: _keyWallets, value: jsonEncode(data));
  }
}
