import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newflutterchatappwithfirebase/components/chat_bubble.dart';
import 'package:newflutterchatappwithfirebase/components/my_textfield.dart';
import 'package:newflutterchatappwithfirebase/services/auth/auth_service.dart';
import 'package:newflutterchatappwithfirebase/services/chat/chat_services.dart';

class ChatPage extends StatefulWidget {
  final String receivingEmail;
  final String receiverId;

  ChatPage({
    super.key,
    required this.receivingEmail,
    required this.receiverId,
  });

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth services
  final ChatServices _chatService = ChatServices();
  final AuthService _authService = AuthService();

  //for text field focus
  FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //add listener to focus node
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
        //cause a delay so that the keyboard has time to show up
        //then the amount of remaining space will be calculate,
        //then the scroll down
        Future.delayed(
          const Duration(milliseconds: 500),
          () => scrollDown(),
        );
      }
    });

    //wait a bit for listview to be build, the scroll to bottom
    Future.delayed(
      const Duration(milliseconds: 500),
      () => scrollDown(),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  // scroll controller
  final ScrollController _scrollController = ScrollController();

  void scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  //send message
  void sendMessage() async {
    //if there is something inside the textField
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(
          widget.receiverId, _messageController.text);

      //clear the controller
      _messageController.clear();
    }
    scrollDown();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(widget.receivingEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
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
        stream: _chatService.getMessages(widget.receiverId, senderId),
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
            controller: _scrollController,
            children: snapshot.data!.docs
                .map((doc) => _builderMessageItem(doc))
                .toList(),
          );
        });
  }

//build message item
  Widget _builderMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    //align message to the right if sender is current user otherwise left
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.center,
          children: [
            ChatBubble(
              message: data["message"],
              isCurrentUser: isCurrentUser,
            ),
          ],
        ));
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
            focusNode: myFocusNode,
          ),
        ),

        //send button
        Container(
          decoration: const BoxDecoration(
            color: Colors.purple,
            shape: BoxShape.circle,
          ),
          margin: const EdgeInsets.only(right: 25),
          child: IconButton(
            onPressed: sendMessage,
            icon: const Icon(
              Icons.arrow_upward,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
