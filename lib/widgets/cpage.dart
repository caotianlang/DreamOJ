// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:dreamoj/widgets/topbar.dart';
import 'package:flutter/material.dart';

class basicCPage extends StatelessWidget {
  final child;

  const basicCPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(8, 0, 0, 0)),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: TopBar(),
            ),
            Expanded(
              flex: 20,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
