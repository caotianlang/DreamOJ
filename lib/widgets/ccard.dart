// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

class cCard extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  const cCard({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}
