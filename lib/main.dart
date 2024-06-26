import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newflutterchatappwithfirebase/auth/auth_gate.dart';
import 'package:newflutterchatappwithfirebase/firebase_options.dart';
import 'package:newflutterchatappwithfirebase/themes/light_mode.dart';
import 'package:newflutterchatappwithfirebase/auth/login_or_register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthGate(),
    );
  }
}
