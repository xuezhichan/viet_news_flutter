import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/page/mine/LoginPage.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/res/style.dart';
import 'package:viet_news_flutter/view/CommonItem.dart';
import 'package:viet_news_flutter/util/User.dart';
import 'package:viet_news_flutter/view/SettingsGroup.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePageStatus();
}

class _MinePageStatus extends State<MinePage> with TickerProviderStateMixin {
  String userName;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget userItem = new Container(
      padding: const EdgeInsets.all(left_right_margin),
      color: bg_white,
      child: new Row(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(
                right: left_right_margin,
                top: top_bottom_middle,
                bottom: top_bottom_middle),
            child: new Image.asset("images/ic_default_article.png",
                width: icon_user, height: icon_user, fit: BoxFit.cover),
          ),
          new Expanded(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                new Container(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: new Text(
                    userName == null
                        ? Local.of(context).login_please
                        : userName,
                    style: text_style_16_black_bold,
                  ),
                ),
                new Text(
                    "${Local.of(context).fans} 1.2w | ${Local.of(context).attention} 10",
                    style: text_style_14_gray_light),
              ])),
          CupertinoButton(
            padding: const EdgeInsets.only(
                left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
            color: Colors.red[500],
            borderRadius: const BorderRadius.all(Radius.circular(60.0)),
            onPressed: () {},
            minSize: 16.0,
            child: Row(
              children: <Widget>[
                Image.asset("images/edit.png",
                    width: 16.0, height: 16.0, fit: BoxFit.contain),
                Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text(
                      Local.of(context).edit,
                      style: text_style_12_white,
                    ))
              ],
            ),
          ),
        ],
      ),
    );

//<<<<<<< HEAD
//    Widget myWallet = new ListTile(
//        leading: const Icon(Icons.favorite),
//        title: Text(Local.of(context).my_wallet),
//        trailing:
//            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
//        onTap: () async {
//          await User.currentUser.isLogin().then((isLogin) {
//            if (isLogin) {
//              router(LoginPage());
//            } else {
//              print('aaron login');
//              router(LoginPage());
//            }
//          });
//        });
//
//    Widget inviteFriends = new ListTile(
//        leading: const Icon(Icons.info),
//        title: Text(Local.of(context).invite_friends),
//        trailing:
//            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
//        onTap: () => router(LoginPage()));
//
//    Widget favorite = new ListTile(
//        leading: const Icon(Icons.info),
//        title: Text(Local.of(context).favorite),
//        trailing:
//            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
//        onTap: () => router(LoginPage()));
//    Widget settings = new ListTile(
//        leading: const Icon(Icons.info),
//        title: Text(Local.of(context).settings),
//        trailing:
//            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
//        onTap: () => router(LoginPage()));
//=======
//>>>>>>> 6bca4e3213b860fa73ce565375aea38c732df301
//    Widget logout = new ListTile(
//        leading: const Icon(Icons.info),
//        title: Text(Local.of(context).logout),
//        trailing:
//            Icon(Icons.chevron_right, color: Theme.of(context).accentColor),
//        onTap: () async {
//          User.currentUser.logout();
//          setState(() {
//            userName = null;
//          });
//        });

    return Scaffold(
        appBar: AppBar(
          title: Text(Local.of(context).mine,
              style: Theme.of(context)
                  .textTheme
                  .title
                  .copyWith(color: text_black)),
          centerTitle: true,
          backgroundColor: bg_white,
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            userItem,
            SettingsGroup(<Widget>[
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).my_wallet,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return new LoginPage();
                      }));
                    } else {
                      print('aaron login');
                      router(LoginPage());
                    }
                  });
                },
              ),
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).invite_friends,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      router(LoginPage());
                    } else {
                      print('aaron login');
                      router(LoginPage());
                    }
                  });
                },
              ),
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).favorite,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      router(LoginPage());
                    } else {
                      print('aaron login');
                      router(LoginPage());
                    }
                  });
                },
              ),
              CommonItem(
                type: CommonItemType.modal,
                label: Local.of(context).settings,
                hasDetails: true,
                onPress: () async {
                  await User.currentUser.isLogin().then((isLogin) {
                    if (isLogin) {
                      router(LoginPage());
                    } else {
                      print('aaron login');
                      router(LoginPage());
                    }
                  });
                },
              ),
            ])
          ],
        ));
  }

  router(Widget widget) {
    Navigator.of(context, rootNavigator: true)
        .push(new MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
