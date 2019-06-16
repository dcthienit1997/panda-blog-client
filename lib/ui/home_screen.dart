import 'package:cdhtttfrontend/ui/assets/colors.dart';
import 'package:cdhtttfrontend/ui/widget/posts_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomeScreenState();
  }

}

class _HomeScreenState extends State<HomeScreen> {

  Widget _home;
  Widget _bodyContent;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _bodyContent
    _bodyContent = new PostsScrollListView();
    // _home widget
    _home = new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Appbar demo"),
        backgroundColor: Colors.amber,
      ),
      body: _bodyContent,

    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: PandaColors.backgroundNormal,
      body: _home,
    );
  }
}