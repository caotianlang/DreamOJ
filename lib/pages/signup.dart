// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:html';

import 'package:dreamoj/models/models.dart';
import 'package:dreamoj/widgets/ccard.dart';
import 'package:dreamoj/widgets/cpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';

class isObsureText with ChangeNotifier {
  bool _obsure = true;

  get isObuure => _obsure;

  void change() {
    _obsure = !_obsure;
    notifyListeners();
  }
}

String username = '';
String password = '';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return basicCPage(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(150, 255, 235, 59),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cCard(
                height: 350,
                width: 550,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            fontSize: 42,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12, top: 4),
                        child: Container(
                          color: Colors.black,
                          width: 40,
                          height: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(labelText: '用户名'),
                          onChanged: (value) {
                            username = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChangeNotifierProvider(
                          create: (context) => isObsureText(),
                          child: Consumer<isObsureText>(
                              builder: (context, value, child) {
                            return TextField(
                              decoration: InputDecoration(
                                labelText: '密码',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    value.change();
                                  },
                                ),
                              ),
                              obscureText: value.isObuure,
                              onChanged: (value) {
                                password = value;
                              },
                            );
                          }),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: SizedBox(
                          width: 160,
                          height: 48,
                          child: Consumer<SeverAddress>(
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
                                              style: BorderStyle.none)))),
                              onPressed: () {
                                var passwordBytes = utf8.encode(password);
                                var passwordMD5 =
                                    md5.convert(passwordBytes).toString();

                                Dio().post(
                                  '${value.addr}/signup',
                                  data: {
                                    'username': username,
                                    'password': passwordMD5,
                                  },
                                ).then((response) {
                                  assert(response.statusCode == HttpStatus.ok);
                                  if (response.data['signup'] == 'username') {
                                    var snackBar = SnackBar(
                                      content: SizedBox(
                                        height: 30,
                                        child: Center(child: Text('用户名已存在')),
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    window.localStorage['username'] = username;
                                    Navigator.pushNamed(context, '/');
                                  }
                                });
                              },
                              child: Text(
                                '登录',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w200),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
