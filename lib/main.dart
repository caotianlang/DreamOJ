import 'package:dreamoj/models/models.dart';
import 'package:dreamoj/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SeverAddress()),
        ChangeNotifierProvider(create: (context) => CurrPage()),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'DreamOJ',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: '/',
        );
      },
    );
  }
}
