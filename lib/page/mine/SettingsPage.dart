import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:viet_news_flutter/local/Local.dart';
import 'package:viet_news_flutter/res/colors.dart';
import 'package:viet_news_flutter/res/dimens.dart';
import 'package:viet_news_flutter/res/style.dart';
import 'package:viet_news_flutter/view/CommonItem.dart';
import 'package:viet_news_flutter/view/SettingsGroup.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    //用户头像
    Widget userIcon = new Container(
      padding: const EdgeInsets.only(
          left: left_right_margin,
          top: left_right_margin,
          bottom: left_right_margin),
      color: bg_white,
      child: new Row(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.only(
                top: top_bottom_middle, bottom: top_bottom_middle),
            child: Text(Local.of(context).avatar, style: text_style_16_black),
          )),
          Container(
            padding: EdgeInsets.only(right: 5.0),
            child: Image.asset("images/ic_default_article.png",
                width: icon_user, height: icon_user, fit: BoxFit.cover),
          ),
          Container(
              padding: EdgeInsets.only(left: 5.0, right: 8.5),
              child: Icon(
                CupertinoIcons.forward,
                color: mediumGrayColor,
                size: 21.0,
              )),
        ],
      ),
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: bg_white,
      appBar: AppBar(
        brightness: Brightness.light,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(Local.of(context).personal_info,
            style:
                Theme.of(context).textTheme.title.copyWith(color: text_black)),
        centerTitle: true,
        backgroundColor: bg_white,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          userIcon,
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Divider(height: 0.3, color: CupertinoColors.inactiveGray),
          ),
          SettingsGroup(<Widget>[
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).magic_num,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).nickname,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).phoneNum,
              hasDetails: true,
              onPress: () async {},
            ),
            CommonItem(
              type: CommonItemType.modal,
              label: Local.of(context).password,
              hasDetails: true,
              onPress: () async {},
            ),
          ])
        ],
      ),
    );
  }
}
