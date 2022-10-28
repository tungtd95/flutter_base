import 'package:flutter/material.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:walletconnect_secure_storage/walletconnect_secure_storage.dart';

class WalletConnectWallet extends StatefulWidget {
  const WalletConnectWallet({Key? key}) : super(key: key);

  @override
  State<WalletConnectWallet> createState() => _WalletConnectWalletState();
}

class _WalletConnectWalletState extends State<WalletConnectWallet>
    with WidgetsBindingObserver {
  TextEditingController controller = TextEditingController();
  final sessionStorage = WalletConnectSecureStorage();

  WalletConnect? connector;
  bool connected = false;
  String peerConnected = '';
  int? idTransaction;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _reconnect();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("WTF resumed");
        break;
      case AppLifecycleState.inactive:
        print("WTF inactive");
        break;
      case AppLifecycleState.paused:
        print("WTF paused --> connector closed");
        break;
      case AppLifecycleState.detached:
        connector?.close();
        print("WTF detached");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'input link to connect'),
            controller: controller,
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          SizedBox(height: 24),
          Text(peerConnected.isEmpty ? '' : 'Connected to: $peerConnected'),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: connected ? _disconnect : _connect,
            child: Text(connected ? 'Disconnect' : 'Connect'),
          ),
          if (idTransaction != null)
            ElevatedButton(
              onPressed: () async {
                final result =
                    await connector?.rejectRequest(id: idTransaction!);
                idTransaction = null;
                setState(() {});
              },
              child: Text('Reject $idTransaction'),
            ),
        ],
      ),
    );
  }

  _connect() {
    if (controller.text.trim().isEmpty) {
      return;
    }

    connector = WalletConnect(
      uri: controller.text,
      clientMeta: PeerMeta(
        name: 'WalletConnect',
        description: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );

    connector?.on('session_request', (event) async {
      print("WTF session_request: $event");

      await connector?.approveSession(
        accounts: ['0x62a9B1AB58c3B59eF17923792122985d210A94A1'],
        chainId: 56,
      );

      sessionStorage.store(connector!.session);

      setState(() {
        connected = true;
        peerConnected = (event as WCSessionRequest?)?.peerMeta?.name ?? '';
      });
    });

    _sub();
  }

  _reconnect() async {
    final oldSession = await sessionStorage.getSession();
    if (oldSession == null) return;

    connector = WalletConnect(session: oldSession);

    connector?.reconnect();

    setState(() {
      connected = true;
      peerConnected = oldSession.peerMeta?.name ?? '';
    });

    _sub();
  }

  _sub() {
    connector?.on<JsonRpcRequest>('eth_sendTransaction', (event) {
      print("WTF eth_sendTransaction: $event");
      idTransaction = event.id;
      setState(() {});
    });

    connector?.on('disconnect', (event) {
      print("WTF disconnect ${event}");
      if (!connected) {
        return;
      }
      _disconnect();
    });
  }

  _disconnect() async {
    await connector?.killSession();
    await sessionStorage.removeSession();
    connector = null;
    peerConnected = '';
    controller.clear();
    setState(() {
      connected = false;
    });
  }

  @override
  void dispose() {
    connector?.close();
    super.dispose();
  }
}
