import 'dart:core';

import 'package:cdhtttfrontend/model/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostController {

  // get all posts
  Future<List<Post>> getPosts() async {

    final client = http.Client();
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    return await client
//        .get("https://jsonplaceholder.typicode.com/posts")
        .get("http://192.168.12.193:8080/posts", headers: headers)
        .then((response) {
          if (response.statusCode < 200 && response.statusCode >= 400) {
            return null;
          } else {
            List list = json.decode(response.body) as List;
            return list.map((m) => Post.fromJson(json.decode(json.encode(m)))).toList();
          }
    });
  }

}

