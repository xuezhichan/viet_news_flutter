import 'dart:async';

import 'package:flutter/material.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";

class NewsPage extends StatefulWidget {
  NewsPage(this.channelId);

  final String channelId;
  int count = 0;

  @override
  State<StatefulWidget> createState() => _NewsPageStatus();
}

class _NewsPageStatus extends State<NewsPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      onRefresh: _onRefresh,
      onOffsetChange: _onOffsetCallback,
      child: ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                "channelId = ${widget.channelId} , index = $index , count = ${widget.count}",
                style: TextStyle(color: Colors.red[500]),
              ),
            );
          }),
    );
  }

  Future<void> _onRefresh(bool up) async {
    if (up) {
      setState(() {
        widget.count++;
      });
    } else {
      //footerIndicator Callback
    }
  }

  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }
}
