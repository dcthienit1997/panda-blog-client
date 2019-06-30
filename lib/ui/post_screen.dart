import 'package:cdhtttfrontend/model/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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
              backgroundColor: Colors.black12,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                background: Image.asset(
                  "assets/imgs/img0.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: SingleChildScrollView(
            child: Html(
              data: post.content,
              padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
            ),
          ),
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
