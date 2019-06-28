import 'package:cdhtttfrontend/ui/assets/colors.dart';
import 'package:cdhtttfrontend/ui/widget/appbar.dart';
import 'package:cdhtttfrontend/ui/widget/posts_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen> {

  Widget _home;
  Widget _home2;
  Widget _bodyContent;

  @override
  void initState() {
    super.initState();
    // _bodyContent
    _bodyContent = new PostsScrollListView();
    // _home widget
    _home = new Scaffold(
      appBar: PandaAppbar.buildAppbar(context, "Panda's blog"),
      body: _bodyContent,
    );
    _home2 = Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: _bodyContent,
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: PandaAppbar.buildAppbar(context, "Panda's blog"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PandaColors.backgroundNormal,
      body: _home2,
    );
  }
}