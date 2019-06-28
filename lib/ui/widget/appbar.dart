import 'package:flutter/material.dart';

class PandaAppbar {
  static PreferredSize buildAppbar(BuildContext context, String title) {
    final appBar = PreferredSize(
      preferredSize: Size(double.infinity, 80),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
        ),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.5),
          elevation: 0,
          centerTitle: true,
          title: Text(
            title,
            style: TextStyle(
              color: Color(0xff6e6e6e),
              fontFamily: 'DancingScript',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
    return appBar;
  }
}
