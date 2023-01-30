// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dreamoj/widgets/ccard.dart';
import 'package:flutter/material.dart';
import 'package:dreamoj/widgets/cpage.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return cPage(
      mainWidget: cCard(
        child: Column(
          children: [
            Text(
              "OOPS!",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("404 Not Found"),
          ],
        ),
      ),
    );
  }
}
