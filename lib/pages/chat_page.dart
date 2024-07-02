import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receivingEmail;

  const ChatPage({super.key, required this.receivingEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receivingEmail),
      ),
    );
  }
}
