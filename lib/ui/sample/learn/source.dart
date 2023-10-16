import 'package:android_play_install_referrer/android_play_install_referrer.dart';
import 'package:flutter/material.dart';

class SourceScreen extends StatefulWidget {
  const SourceScreen({super.key});

  @override
  State<SourceScreen> createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  ReferrerDetails? referrerDetails;

  @override
  void initState() {
    super.initState();
    _getSource();
  }

  _getSource() async {
    referrerDetails = await AndroidPlayInstallReferrer.installReferrer;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'referrerDetails: ' + (referrerDetails?.toString() ?? ''),
        ),
      ),
    );
  }
}