import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HeavyComputation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HeavyComputationState();
}

class _HeavyComputationState extends State<HeavyComputation> {
  final int pos = 43;
  int _fibo = 0;

  @override
  void initState() {
    super.initState();
    calculateFibo();
  }

  void calculateFibo() async {
    // _fibo = await _fiboAtNaive(pos);
    _fibo = await compute(_fiboAtNaive, pos);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('fibonacci @ $pos is $_fibo'),
      ),
    );
  }
}

int _fiboAtNaive(int n) {
  if (n == 1 || n == 2) return 1;
  return _fiboAtNaive(n - 1) + _fiboAtNaive(n - 2);
}

int _fiboAtOptimized(int n) {
  int fibo1 = 1;
  int fibo2 = 1;
  for (var i = 3; i <= n; i++) {
    int fibo1Temp = fibo1;
    fibo1 = fibo2;
    fibo2 += fibo1Temp;
  }
  return fibo2;
}
