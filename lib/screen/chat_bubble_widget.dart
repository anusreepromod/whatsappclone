import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/single_chat_model.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({Key? key, required SingleChat this.data}) : super(key: key);
  SingleChat data;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          data.isSend == true ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 110),
        child: Card(
          color: data.isSend == true ? Color(0xFFDCF8C6) : Colors.white,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 30, 20),
                child: Text(
                  data.message.toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 2,
                child: Row(
                  children: [
                    Text(data.sendAt.toString()),
                    Icon(
                      Icons.done_all,
                      color: Colors.blue,
                      size: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
