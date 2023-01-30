// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dreamoj/models/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Spacer(
            flex: 2,
          ),
          SizedBox(
            width: 16.0, // 8.0 + 8.0
          ),
          Expanded(
            flex: 10,
            child: Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Consumer<SeverAddress>(
                  builder: ((context, value, child) {
                    return Image.network("${value.addr}/images/OJ.png");
                  }),
                ),
                SizedBox(
                  width: 16,
                ),
                Row(
                  children: [
                    TopBarItem(
                      id: 0,
                      uri: "/",
                      text: "首页",
                    ),
                    TopBarItem(
                      id: 1,
                      uri: "/problems",
                      text: "题库",
                    ),
                    TopBarItem(
                      id: 2,
                      uri: "/competition",
                      text: "比赛",
                    ),
                    TopBarItem(
                      id: 3,
                      uri: "/discuss",
                      text: "讨论",
                    ),
                    TopBarItem(
                      id: 4,
                      uri: "/store",
                      text: "商店",
                    ),
                  ],
                ),
                Spacer(),
                Consumer<User>(
                  builder: (context, value, child) {
                    return value.is_login
                        ? Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              alignment: Alignment.centerLeft,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(8, 0, 0, 0),
                              ),
                              child: Text("User"),
                            ),
                          )
                        : Row(
                            children: [
                              TopBarItem(
                                id: 5,
                                uri: '/login',
                                text: "登录",
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Consumer<CurrPage>(
                                  builder: (context, value, child) {
                                return ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(150, 255, 235, 59)),
                                    shadowColor: MaterialStateProperty.all(
                                        Color.fromARGB(0, 0, 0, 0)),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all(
                                        StadiumBorder(
                                            side: BorderSide(
                                                style: BorderStyle.none))),
                                  ),
                                  onPressed: () {
                                    value.changePage(-1);
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                  child: Text("注册"),
                                );
                              }),
                            ],
                          );
                  },
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 16.0, // 8.0 + 8.0
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}

class TopBarItem extends StatelessWidget {
  final int id;
  final String uri;
  final String text;

  const TopBarItem({
    super.key,
    required this.id,
    required this.uri,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrPage>(
      builder: (context, value, child) {
        return MouseRegion(
          onEnter: (event) {
            value.mouseChange(id);
          },
          onExit: (event) {
            value.mouseChange(-1);
          },
          child: InkWell(
            onTap: () {
              value.changePage(id);
              Navigator.pushNamed(context, uri);
            },
            child: Container(
              decoration: BoxDecoration(
                color:
                    id == value.hoverPage ? Color.fromARGB(8, 0, 0, 0) : null,
              ),
              alignment: Alignment.center,
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 10,
                    child: Center(
                      child: Text(text),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Divider(
                      color: id == value.hoverPage
                          ? Colors.blue
                          : (id == value.currPage
                              ? Colors.red
                              : Color.fromARGB(0, 0, 0, 0)),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
