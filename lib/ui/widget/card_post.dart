import 'dart:math';

import 'package:cdhtttfrontend/model/post.dart';
import 'package:cdhtttfrontend/ui/post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CardPost extends StatelessWidget {

  final Post post;

  const CardPost({ Key key, this.post}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> imgs = new List<String>();
    imgs.add("assets/imgs/img0.jpg");
    imgs.add("assets/imgs/img1.jpg");
    imgs.add("assets/imgs/img2.jpg");
    imgs.add("assets/imgs/img3.jpg");
    imgs.add("assets/imgs/img4.jpg");
    imgs.add("assets/imgs/img5.jpg");
    imgs.add("assets/imgs/img6.jpg");
    imgs.add("assets/imgs/img7.jpg");
    imgs.add("assets/imgs/img8.jpg");
    imgs.add("assets/imgs/img9.jpg");
    imgs.add("assets/imgs/img10.jpg");
    imgs.add("assets/imgs/img11.jpg");
    imgs.add("assets/imgs/img12.jpg");
    imgs.add("assets/imgs/img13.jpg");
    Random rd = new Random();
    String randomImg() {
      return imgs.elementAt(rd.nextInt(12));
    }
    
    final card_post = Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        elevation: 0,
        child: InkWell(
          onTap: () {
//            print(post.title);
//            Navigator.of(context).pushNamed('/post');
            
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => PostScreen(post: post),
            ));
            
          },
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 175,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        randomImg(),
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(6.0, 7.0),
                        blurRadius: 13,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(17)),
                  ),

                ),
                Container(
                    padding: EdgeInsets.fromLTRB(8, 16, 20, 8),
                    width: double.infinity,
                    child: Text(
                        post.title.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      textAlign: TextAlign.left,
                    )
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Text(post.view.toString(),
                              style: TextStyle(
                                fontSize: 14
                              ),
                            ),
                          ),
                          Icon(Icons.remove_red_eye,
                            color: Color(0xff5e5e5e),
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Text(post.clap.toString(),
                              style: TextStyle(
                                  fontSize: 14
                              ),
                            ),
                          ),
                          Icon(FontAwesomeIcons.signLanguage,
                          color: Color(0xff5e5e5e),
                          size: 15,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                        child: Text(DateFormat.yMMMMEEEEd().format(post.date),
                          style: TextStyle(
                              fontSize: 11
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return card_post;
  }

}