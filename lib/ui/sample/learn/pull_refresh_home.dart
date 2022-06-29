import 'dart:io';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PullToRefreshHome extends StatefulWidget {
  final Widget widget;
  VoidFutureCallBack onRefresh;

  PullToRefreshHome({Key? key, required this.widget, required this.onRefresh})
      : super(key: key);

  @override
  _PullToRefreshHomeState createState() => _PullToRefreshHomeState();
}

class _PullToRefreshHomeState extends State<PullToRefreshHome> {
  static const _indicatorSize = 100.0;
  final _helper = IndicatorStateHelper();

  /// Whether to render check mark instead of spinner
  bool _renderCompleteState = false;

  ScrollDirection prevScrollDirection = ScrollDirection.idle;

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicator(
      offsetToArmed: _indicatorSize,
      onRefresh: widget.onRefresh,
      child: widget.widget,
      completeStateDuration: const Duration(seconds: 1),
      notificationPredicate: (notification) {
        if (notification is OverscrollNotification || Platform.isIOS) {
          return notification.depth == 2;
        }
        return notification.depth == 0;
      },
      builder: (
        BuildContext context,
        Widget child,
        IndicatorController controller,
      ) {
        double containerHeight = 0;
        double offsetDy = 0;

        return Stack(
          children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? _) {
                _helper.update(controller.state);
                prevScrollDirection = controller.scrollingDirection;
                if (Platform.isAndroid) {
                  containerHeight = controller.value * _indicatorSize;
                  offsetDy = controller.value * _indicatorSize;
                } else if (Platform.isIOS) {
                  containerHeight = controller.value * _indicatorSize * 3;
                  offsetDy = controller.value * _indicatorSize * 3;
                }
                if (containerHeight == 0.0) {
                  return const SizedBox.shrink();
                } else {
                  return _posiLoadingWidget(containerHeight);
                }
              },
            ),
            AnimatedBuilder(
              builder: (context, _) {
                return Transform.translate(
                  offset: Offset(0.0, offsetDy),
                  child: child,
                );
              },
              animation: controller,
            ),
          ],
        );
      },
    );
  }

  Widget _posiLoadingWidget(double containerHeight) {
    return Container(
      alignment: Alignment.center,
      height: containerHeight,
      child: OverflowBox(
        alignment: Alignment.center,
        child: AnimatedContainer(
          color: Colors.amber,
          duration: const Duration(seconds: 1),
          alignment: Alignment.center,
          child: Text("WTFFF"),
        ),
      ),
    );
  }
}
