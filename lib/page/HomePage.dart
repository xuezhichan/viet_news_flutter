import 'package:flutter/material.dart';
import 'package:viet_news_flutter/page/mine/MinePage.dart';
import 'package:viet_news_flutter/page/find/FindPage.dart';
import 'package:viet_news_flutter/page/follow/FollowPage.dart';
import 'package:viet_news_flutter/page/task/TaskPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:viet_news_flutter/res/colors.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var tabImages;
  int _tabIndex = 0;
  var appBarTitles = ['Find', 'Follow', 'Task', 'Mine'];

  //初始化数据
  void initData() {
    //初始化选中和未选中的icon
    tabImages = [
      [
        getTabImage('images/ic_find_unselect.png'),
        getTabImage('images/ic_find_select.png')
      ],
      [
        getTabImage('images/ic_follow_unselect.png'),
        getTabImage('images/ic_follow_select.png')
      ],
      [
        getTabImage('images/ic_task_unselect.png'),
        getTabImage('images/ic_task_select.png')
      ],
      [
        getTabImage('images/ic_mine_unselect.png'),
        getTabImage('images/ic_mine_select.png')
      ]
    ];
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
            BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
            BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
            BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return
                IndexedStack(
                  index: _tabIndex,
                  children: <Widget>[
                    FindPage(),
                    FollowPage(),
                    TaskPage(),
                    MinePage(),
                  ],
                );
            },
          );
        });
  }

  //根据选择获得对应的normal或是press的icon
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  //获取bottomTab的颜色和文字
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: text_red));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 14.0, color: text_gray));
    }
  }

}



