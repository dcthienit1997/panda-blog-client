import 'package:cdhtttfrontend/ui/home_screen.dart';
import 'package:cdhtttfrontend/ui/post_screen.dart';
import 'package:flutter/widgets.dart';

final routes = {
  '/': (BuildContext context) => new HomeScreen(),
  'home': (BuildContext context) => new HomeScreen(),
  '/post': (BuildContext context) => new PostScreen(),
};