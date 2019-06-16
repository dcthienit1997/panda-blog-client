import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
  final String id;
  final String title;
  final String content;
  final DateTime date;
  final int clap;
  final int view;
  final bool release;

  const Post({
    this.id,
    this.title,
    this.content,
    this.date,
    this.clap,
    this.view,
    this.release
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

}

class PostList {
  final List<Post> posts;
  PostList({
    this.posts,
});
  factory PostList.fromJson(List<dynamic> parseJson){
    List<Post> posts = new List<Post>();
    posts = parseJson.map((f) => Post.fromJson(f)).toList();
    return new PostList(
      posts: posts,
    );
  }
}