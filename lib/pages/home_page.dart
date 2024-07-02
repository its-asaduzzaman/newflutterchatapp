import 'package:flutter/material.dart';
import 'package:newflutterchatappwithfirebase/auth/auth_service.dart';

import '../components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: const Center(child: Text("Home page")),
    );
  }
}
