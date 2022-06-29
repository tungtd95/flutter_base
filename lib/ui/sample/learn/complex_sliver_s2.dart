import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ComplexSliversS2 extends StatefulWidget {
  const ComplexSliversS2({
    Key? key,
  }) : super(key: key);

  @override
  _ComplexSliversS2State createState() => _ComplexSliversS2State();
}

class _ComplexSliversS2State extends State<ComplexSliversS2> {
  final scrollDirection = Axis.vertical;
  late AutoScrollController controller;

  int selectedTab = 1;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex sliver solution 2"),
      ),
      body: CustomScrollView(
        controller: controller,
        slivers: [
          ...([0, 1, 2, 3]
              .map((e) => SliverToBoxAdapter(
                    child: buildItem(
                      e,
                      type: TabType.type0,
                    ),
                  ))
              .toList()),
          SliverToBoxAdapter(
            child: SizedBox(height: 8),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              controller: controller,
              onTap: (index) {
                setState(() {
                  selectedTab = index;
                  controller.scrollToIndex(
                    123,
                    preferPosition: AutoScrollPosition.begin,
                  );
                  Future.delayed(Duration(milliseconds: 100), () {

                  });
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: AutoScrollTag(
              key: ValueKey(123),
              controller: controller,
              index: 123,
              child: SizedBox(height: 8),
            ),
          ),
          if (selectedTab == 1) contentTab1(),
          if (selectedTab == 2) contentTab2(),
          if (selectedTab == 3) contentTab3(),
          SliverToBoxAdapter(
            child: SizedBox(height: 500),
          ),
        ],
      ),
    );
  }

  Widget buildItem(
    int index, {
    TabType type = TabType.type1,
    bool firstItem = false,
  }) {
    Color color = Colors.greenAccent;
    switch (type) {
      case TabType.type1:
        color = Colors.yellowAccent;
        break;
      case TabType.type2:
        color = Colors.cyanAccent;
        break;
      case TabType.type3:
        color = Colors.purpleAccent;
        break;
      default:
    }
    return Card(
      key: ValueKey("${index}${type.name}"),
      child: Container(
        width: double.infinity,
        child: Text("item $index"),
        padding: EdgeInsets.all(24),
        color: color,
      ),
    );
  }

  contentTab1() {
    final data = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19];
    final List<Widget> widgets = [];
    for (var i = 0; i < data.length; i++) {
      widgets.add(buildItem(data[i], firstItem: i == 0));
    }

    return SliverList(
      key: ValueKey("TAB1"),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => widgets[index],
        childCount: widgets.length,
      ),
    );
  }

  contentTab2() {
    final data = [1002, 1003, 1010, 2000];
    final List<Widget> widgets = [];
    for (var i = 0; i < data.length; i++) {
      widgets.add(buildItem(data[i], firstItem: i == 0, type: TabType.type2));
    }

    return SliverList(
      key: ValueKey("TAB2"),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => widgets[index],
        childCount: widgets.length,
      ),
    );
  }

  contentTab3() {
    final data = [9, 10, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];
    final List<Widget> widgets = [];
    for (var i = 0; i < data.length; i++) {
      widgets.add(buildItem(data[i], firstItem: i == 0, type: TabType.type3));
    }

    return SliverList(
      key: ValueKey("TAB3"),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => widgets[index],
        childCount: widgets.length,
      ),
    );
  }
}

enum TabType { type0, type1, type2, type3 }

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Function(int index) onTap;
  AutoScrollController controller;

  _SliverAppBarDelegate({required this.onTap, required this.controller});

  @override
  double get minExtent => 48;

  @override
  double get maxExtent => 48;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.red,
      child: new Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 8.0,
          bottom: 8.0,
          right: 8.0,
        ),
        child: Row(
          children: [1, 2, 3].map(buildTab).toList(),
        ),
      ),
    );
  }

  Widget buildTab(int index) {
    return GestureDetector(
      onTap: () {
        onTap.call(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.all(8),
        color: Colors.amber,
        child: Text("tab $index"),
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return true;
  }
}
