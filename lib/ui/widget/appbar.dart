import 'package:flutter/material.dart';

class PandaAppbar {
  static PreferredSize buildAppbar(BuildContext context, String title) {
    final appBar = PreferredSize(
      preferredSize: Size(double.infinity, 80),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffffffff).withOpacity(0.0),
        ),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.5),
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(
              color: Color(0xff3e3e3e),
            ),
          ),
        ),
      ),
    );
    return appBar;
  }
}
