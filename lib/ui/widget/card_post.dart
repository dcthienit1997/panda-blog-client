import 'package:cdhtttfrontend/model/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardPost extends StatelessWidget {

  final Post post;

  const CardPost({ Key key, this.post}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final card_post = Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Container(
          height: 350,
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.red,
                  offset: Offset(0.0, 1.5),
                  blurRadius: 4.5,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(11)),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(11)),
                  color: Colors.blue,
                ),
                child: Text(
                  post.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Text(
                      post.content,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                      ),
                  )
              ),
              Text(post.view.toString()),
              Text(post.clap.toString()),
              Text(post.date.toString()),

            ],
          ),
        ),
      ),
    );
    return card_post;
  }

}