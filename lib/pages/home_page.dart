import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newflutterchatappwithfirebase/services/auth/auth_service.dart';
import 'package:newflutterchatappwithfirebase/services/chat/chat_services.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth services
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build  a list of user except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loading..
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build individual list title for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receivingEmail: userData["email"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
