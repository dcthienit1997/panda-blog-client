import 'dart:core';
import 'dart:async';
import 'dart:convert';
import 'dart:core' as prefix0;

import 'package:cdhtttfrontend/controller/post_controller.dart';
import 'package:cdhtttfrontend/model/post.dart';
import 'package:cdhtttfrontend/model/post.dart' as prefix1;
import 'package:cdhtttfrontend/ui/widget/card_post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostsScrollListView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return PostsScrollListViewState();
  }
}

class PostsScrollListViewState extends State<PostsScrollListView> {

  List<Post> _posts;
  bool _isLoading = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _posts = List<Post>();
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_isLoading) {
      widget = new Center(
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new CircularProgressIndicator()
        ),
      );
    } else {
//      if (_isError || _posts == null || _posts.isEmpty) {
      if (false) {
        if (_isError) {
          widget = new Center(
            child: new Text("Error"),
          );
        }
        if (_posts == null) {
          widget = new Center(
            child: new Text("Posts is null"),
          );
        }
        if (_posts.isEmpty) {
          widget = new Center(
            child: new Text("Posts is empty"),
          );
        }
//        widget = new Center(
//          child: new Text("Oops..! Error fetch server data."),
//        );
      } else {
        widget = Center(
          child: FutureBuilder<List<Widget>>(
            future: getPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Scrollbar(
                  child: ReorderableListView(
                    padding: EdgeInsets.all(16.0),
                    children: snapshot.data,
//                    children: snapshot.data.map<Widget>(builListPost).toList(),
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        if (newIndex > snapshot.data.length) newIndex = snapshot.data.length;
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

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Post post = _posts.removeAt(oldIndex);
      _posts.insert(newIndex, post);
    });
  }
}

Future<List<Widget>> getPosts() async {
  var res = List<Widget>();
  var postController = PostController();
  List<Post> posts = await postController.getPosts();
  print("getPosts");
  print(posts.length);
  for (Post post in posts) {
    final card = Card(
      key: Key(post.id),
      color: Colors.green,
      child: Text(post.title),
    );
    final card2 = CardPost(
      key: Key(post.id),
      post: post,
    );
    res.add(card2);
  }
  return res;
}
