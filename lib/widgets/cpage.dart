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

class cPage extends basicCPage {
  final Widget mainWidget;
  final Widget? leftWidget;
  final Widget? rightWidget;
  final MainAxisAlignment mainAxisAlignment;

  const cPage({
    super.key,
    required this.mainWidget,
    this.leftWidget,
    this.rightWidget,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(child: mainWidget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromARGB(8, 0, 0, 0)),
        child: Column(
          children: [
            TopBar(),
            Expanded(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      Builder(builder: (context) {
                        return leftWidget == null
                            ? Spacer(flex: 2)
                            : Expanded(flex: 2, child: leftWidget!);
                      }),
                      Expanded(
                          flex: 10,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: mainWidget,
                          )),
                      Builder(builder: (context) {
                        return rightWidget == null
                            ? Spacer(flex: 2)
                            : Expanded(flex: 2, child: rightWidget!);
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
