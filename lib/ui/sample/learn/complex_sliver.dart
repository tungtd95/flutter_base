import 'package:flutter/material.dart';
import 'package:flutter_base/ui/sample/learn/pull_refresh_home.dart';
import 'package:flutter_base/ui/sample/learn/sliver_header.dart';

class ComplexSlivers extends StatefulWidget {
  const ComplexSlivers({
    Key? key,
  }) : super(key: key);

  @override
  _ComplexSliversState createState() => _ComplexSliversState();
}

class _ComplexSliversState extends State<ComplexSlivers> {
  final List<String> tabs = <String>['Tab 1', 'Tab 2'];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        appBar: AppBar(
          title: Text("Complex sliver"),
        ),
        body: PullToRefreshHome(
          onRefresh: () async {
            print("WTF onRefresh");
          },
          widget: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverHeaderHome(
                      tabBar: TabBar(
                        tabs:
                            tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              // These are the contents of the tab views, below the tabs.
              children: tabs.map((String name) {
                return SafeArea(
                  top: false,
                  bottom: false,
                  child: Builder(
                    builder: (BuildContext context) {
                      return CustomScrollView(
                        key: PageStorageKey<String>(name),
                        slivers: <Widget>[
                          SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.all(8.0),
                            sliver: SliverFixedExtentList(
                              itemExtent: 48.0,
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return ListTile(
                                    title: Text('Item $index'),
                                  );
                                },
                                childCount: 30,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
