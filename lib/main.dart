import 'package:flutter/material.dart';

import 'Screens/Auth/log_in.dart';
import 'Screens/Customers/ch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Solar Serv',
      home:  LoginScreen(),
    );
  }
}

