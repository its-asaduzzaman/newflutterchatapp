import 'package:flutter/material.dart';
import 'package:newflutterchatappwithfirebase/pages/login_page.dart';
import 'package:newflutterchatappwithfirebase/pages/register_page.dart';
import 'package:newflutterchatappwithfirebase/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home:  RegisterPage(),
    );
  }
}


