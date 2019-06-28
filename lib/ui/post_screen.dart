import 'package:cdhtttfrontend/model/post.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {

  final Post post;

  PostScreen({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(post.title),
                background: Image.asset("", fit: BoxFit.cover,),
              ),
            ),
          ];
        },
        body: Center(
          child: Text(post.content),
        ),
      ),
    );
  }

}

//class _PostScreenState extends State<PostScreen> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: NestedScrollView(
//        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//          return <Widget>[
//            SliverAppBar(
//              expandedHeight: 200,
//              pinned: true,
//              floating: true,
//              flexibleSpace: FlexibleSpaceBar(
//                centerTitle: true,
//                title: Text('Title'),
//                background: Image.asset("assets/imgs/img13.jpg", fit: BoxFit.cover,),
//              ),
//            ),
//          ];
//        },
//        body: Center(
//          child: Text('center'),
//        ),
//      ),
//    );
//  }
//}