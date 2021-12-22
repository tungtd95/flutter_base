import 'package:flutter/material.dart';
import 'package:flutter_base/ui/sample/learn/keys.dart';
import 'package:flutter_base/ui/sample/learn/shrink_wrap_example.dart';

class LearnEntryWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Entry'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            entry(
              context,
              title: 'Custom scroll view',
              child: ShrinkWrapSlivers(),
            ),
            entry(
              context,
              title: 'Keys',
              child: KeyExample(),
            )
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
