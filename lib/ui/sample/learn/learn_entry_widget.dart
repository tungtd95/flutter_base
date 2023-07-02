import 'package:flutter/material.dart';
import 'package:flutter_base/l10n/l10n.dart';
import 'package:flutter_base/ui/sample/learn/heavy_computation.dart';
import 'package:flutter_base/ui/sample/learn/keys.dart';
import 'package:flutter_base/ui/sample/learn/shrink_wrap_example.dart';

class LearnEntryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learning Entry',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(Strings.of(context).helloAny('Alice', 'Vietnam')),
            SizedBox(height: 12),
            entry(
              context,
              title: 'Custom scroll view',
              child: ShrinkWrapSlivers(),
            ),
            entry(
              context,
              title: 'Keys',
              child: KeyExample(),
            ),
            entry(
              context,
              title: 'Heavy Computation',
              child: HeavyComputation(),
            ),
          ],
        ),
      ),
    );
  }

  Widget entry(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return child;
            },
          ),
        );
      },
      child: Text(title),
    );
  }
}
