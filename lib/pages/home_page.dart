import 'package:flutter/material.dart';
import 'package:newflutterchatappwithfirebase/auth/auth_service.dart';

import '../components/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: MyDrawer(),
      body: const Center(child: Text("Home page")),
    );
  }
}
