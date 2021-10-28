import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/models/widgets/utility_widgets.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key? key, required this.data}) : super(key: key);
  Chat data;
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  bool showemoji = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF128C7E),
          leadingWidth: 100,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 18,
                        child: Icon(
                          widget.data.isGroup == true
                              ? Icons.group
                              : Icons.person,
                          size: 20,
                        )),
                  )
                ],
              ),
            ),
          ),
          titleSpacing: 0,
          title: Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data.name.toString(),
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "Last Seen: 09:25pm",
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
          actions: [
            Icon(Icons.video_call),
            Utilitywidget().widthSpacer(15),
            Icon(Icons.call),
            Utilitywidget().widthSpacer(15),
            PopupMenuButton(itemBuilder: (context) {
              return [PopupMenuItem(child: Text("View Contact"))];
            }),
          ]),
      body: Container(
        color: Colors.red,
        child: Stack(children: [
          ListView.builder(itemBuilder: (context, index) {
            return Text("index:${index / 2}");
          }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Card(
                      child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Type a message",
                              prefixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      showemoji = !showemoji;
                                    });
                                  },
                                  icon: Icon(showemoji
                                      ? Icons.keyboard
                                      : Icons.emoji_emotions_outlined)),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.attach_file),
                                  Icon(Icons.camera_alt)
                                ],
                              ))),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blue,
                  ),
                  showemoji ? selectEmoji() : Container(),
                ],
              ))
        ]),
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(onEmojiSelected: (emoji, category) {
      print(emoji.name);
    });
  }
}
