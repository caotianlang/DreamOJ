import 'package:flutter/material.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
    case '/login':
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
    case '/signup':
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
    case '/problems':
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
    case '/competition':
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
    case '/discuss':
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
    case '/store':
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
    default:
      return MaterialPageRoute(builder: (_) => Container(), settings: settings);
  }
}