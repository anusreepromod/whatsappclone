import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/models/widgets/chattile_widget.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  List<Chat> chatList = [
    Chat(
        avatar:
            "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
        name: "Baabte",
        isGroup: true,
        updatedAt: 'fdss',
        message: "Hello"),
    Chat(
        avatar:
            "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50",
        name: "Thanmay",
        isGroup: false,
        updatedAt: 'fdss',
        message: "HI"),
    Chat(
        avatar: "sdjn",
        name: "Cybersquare",
        isGroup: true,
        updatedAt: 'fdss',
        message: "hello"),
    Chat(
        avatar: "sdjn",
        name: "Vismay",
        isGroup: true,
        updatedAt: 'fdss',
        message: "hi")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Chattile(
            data: chatList[index],
          );
        },
        itemCount: chatList.length,
      ),
    );
  }
}
