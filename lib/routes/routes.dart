import 'package:dreamoj/pages/login.dart';
import 'package:dreamoj/pages/signup.dart';
import 'package:dreamoj/pages/unknown.dart';
import 'package:dreamoj/widgets/cpage.dart';
import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => cPage(mainWidget: Container()), settings: settings);
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginPage(), settings: settings);
    case '/signup':
      return MaterialPageRoute(
          builder: (_) => SignupPage(), settings: settings);
    case '/problems':
      return MaterialPageRoute(
          builder: (_) => cPage(mainWidget: Container()), settings: settings);
    case '/competition':
      return MaterialPageRoute(
          builder: (_) => cPage(mainWidget: Container()), settings: settings);
    case '/discuss':
      return MaterialPageRoute(
          builder: (_) => cPage(mainWidget: Container()), settings: settings);
    case '/store':
      return MaterialPageRoute(
          builder: (_) => cPage(mainWidget: Container()), settings: settings);
    default:
      return MaterialPageRoute(
          builder: (_) => UnknownPage(), settings: settings);
  }
}
