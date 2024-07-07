import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newflutterchatappwithfirebase/components/my_textfield.dart';
import 'package:newflutterchatappwithfirebase/services/auth/auth_service.dart';
import 'package:newflutterchatappwithfirebase/services/chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String receivingEmail;
  final String receiverId;

  ChatPage({
    super.key,
    required this.receivingEmail,
    required this.receiverId,
  });

  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth services
  final ChatServices _chatService = ChatServices();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    //if there is something inside the textField
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(receiverId, _messageController.text);

      //clear the controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receivingEmail),
      ),
      body: SafeArea(
        child: Column(
          children: [
            //display all the messages
            Expanded(
              child: _builderMessageList(),
            ),
            //user input
            _buildUserInput(),
          ],
        ),
      ),
    );
  }

  //build message list
  Widget _builderMessageList() {
    String senderId = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverId, senderId),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const Text("ERROR");
          }

          // loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          //return list view
          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _builderMessageItem(doc))
                .toList(),
          );
        });
  }

//build message item
  Widget _builderMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data["message"]);
  }

  //build message input
  Widget _buildUserInput() {
    return Row(
      children: [
        // text field should take  up most of the space
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: "Type a message",
            obscureText: false,
          ),
        ),

        //send button
        IconButton(
          onPressed: sendMessage,
          icon: const Icon(Icons.arrow_upward),
        ),
      ],
    );
  }
}
