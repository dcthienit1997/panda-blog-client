import 'dart:core';
import 'dart:async';
import 'dart:core' as prefix0;

import 'package:cdhtttfrontend/controller/post_controller.dart';
import 'package:cdhtttfrontend/model/post.dart';
import 'package:cdhtttfrontend/ui/widget/card_post.dart';
import 'package:flutter/material.dart';

class PostsScrollListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PostsScrollListViewState();
  }
}

class PostsScrollListViewState extends State<PostsScrollListView> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_isLoading) {
      widget = new Center(
        child: new Padding(
            padding: const EdgeInsets.all(16.0),
            child: new CircularProgressIndicator()),
      );
    } else {
      widget = Center(
        child: FutureBuilder<List<Widget>>(
          future: getPosts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Scrollbar(
                child: ReorderableListView(
                  padding: EdgeInsets.fromLTRB(16, 100, 16, 16),
                  children: snapshot.data,
//                    children: snapshot.data.map<Widget>(builListPost).toList(),
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (newIndex > snapshot.data.length)
                        newIndex = snapshot.data.length;
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      final Widget widget = snapshot.data.removeAt(oldIndex);
                      print("Length when remoreAt: ");
                      print(snapshot.data.length);
                      snapshot.data.insert(newIndex, widget);
                      print("Length when insert: ");
                      print(snapshot.data.length);
                      print("reorder");
                    });
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      );
    }
    return widget;
  }

  Widget builListPost(Post post) {
    return Card(
      key: Key(post.id),
      color: Colors.green,
      child: Text(post.title),
    );
  }
}

Future<List<Widget>> getPosts() async {
  var res = List<Widget>();
  var postController = PostController();
  List<Post> posts = await postController.getPosts();
  print("getPosts");
  print(posts.length);
  for (Post post in posts) {
    final card2 = CardPost(
      key: Key(post.id),
      post: post,
    );
    res.add(card2);
  }
  return res;
}
