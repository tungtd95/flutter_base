import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_base/ui/sample/learn/external_wallet.dart';
import 'package:flutter_base/ui/sample/learn/external_wallet_repo.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WalletConnectWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WalletConnectWidgetState();
  }
}

class WalletConnectWidgetState extends State<WalletConnectWidget> {
  ExternalWalletRepo _walletRepo = ExternalWalletRepo();
  List<ExternalWallet> _externalWallets = [];
  late StreamSubscription streamSubscription;

  String uriForNewWallet = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      streamSubscription = _walletRepo.walletsSubject.stream.listen((event) {
        setState(() {
          _externalWallets = event;
          uriForNewWallet = '';
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WalletConnect demo'),
      ),
      body: Column(
        children: [
          _buildWallets(),
          _buildQRCode(),
          _createWalletWidget(),
        ],
      ),
    );
  }

  Widget _buildWallets() {
    return Expanded(
      child: Container(
        color: Colors.lightBlueAccent,
        child: ListView(
          children: _externalWallets
              .map((e) => Container(
                    color: Colors.green,
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.peerMeta?.name ?? 'Wallet Unknown',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          e.accounts.first,
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildQRCode() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            if (uriForNewWallet.isNotEmpty)
              QrImage(
                data: uriForNewWallet,
                size: 300,
              ),
            Text(uriForNewWallet),
          ],
        ),
      ),
    );
  }

  Widget _createWalletWidget() {
    return SafeArea(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              _walletRepo.createNewWallet((uri) {
                setState(() {
                  uriForNewWallet = uri;
                });
              });
            },
            child: Text('create new connection'),
          ),
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              _walletRepo.reconnectNetwork();
            },
            child: Text('reconnect network'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamSubscription.cancel();
    super.dispose();
  }
}
