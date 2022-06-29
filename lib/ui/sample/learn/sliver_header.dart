import 'package:flutter/material.dart';

class SliverHeaderHome extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color? indicatorColor;
  final EdgeInsetsGeometry? labelPadding;
  final bool isScrollable;
  final Color? colorBackground;
  final EdgeInsets? margin;
  final BorderRadiusGeometry? borderRadius;

  SliverHeaderHome({
    this.indicatorColor,
    this.labelPadding,
    this.isScrollable = false,
    this.colorBackground,
    required this.tabBar,
    this.margin,
    this.borderRadius,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {

    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: colorBackground ?? Colors.greenAccent,
        border: borderRadius == null
            ? Border(
                bottom: BorderSide(
                  color: Colors.greenAccent,
                  width: 1,
                ),
              )
            : null,
        borderRadius: borderRadius,
      ),
      width: double.infinity,
      child: Stack(children: [
        tabBar,
        Positioned(
          bottom: 0,
          child: Container(
            width: 1 * MediaQuery.of(context).size.width,
            height: 1,
            color: Colors.green,
          ),
        ),
      ]),
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
