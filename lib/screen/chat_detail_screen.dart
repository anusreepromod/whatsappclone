import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/models/chat_model.dart';
import 'package:whatsapp_clone/models/single_chat_model.dart';
import 'package:whatsapp_clone/models/widgets/utility_widgets.dart';
import 'package:whatsapp_clone/screen/chat_bubble_widget.dart';

class ChatDetailScreen extends StatefulWidget {
  ChatDetailScreen({Key? key, required this.data}) : super(key: key);
  Chat data;
  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  TextEditingController messageController = TextEditingController();
  bool showemoji = false;
  FocusNode _focusNode = FocusNode();
  bool showSend = false;
  List<SingleChat> chats = [
    SingleChat(isSend: true, isReaded: true, message: "hello", sendAt: "2pm"),
    SingleChat(isSend: false, isReaded: false, message: "hi", sendAt: "3pm"),
    SingleChat(isSend: true, isReaded: true, message: "hello", sendAt: "4pm"),
    SingleChat(isSend: false, isReaded: false, message: "hi", sendAt: "5pm"),
    SingleChat(isSend: true, isReaded: true, message: "hello", sendAt: "6pm"),
    SingleChat(isSend: false, isReaded: false, message: "hi", sendAt: "7pm")
  ];
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        print("if");
        setState(() {
          showemoji = false;
        });
      } else {
        print("else");
      }
    });
  }

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
        color: Colors.blueGrey,
        child: Stack(children: [
          Image.asset(
            "assets/images/WhatsApp2.jpeg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  data: chats[index],
                );
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        child: Card(
                          child: TextField(
                              onChanged: (value) {
                                print(value);
                                if (value.length > 0) {
                                  setState(() {
                                    showSend = true;
                                  });
                                } else {
                                  setState(() {
                                    showSend = false;
                                  });
                                }
                              },
                              controller: messageController,
                              focusNode: _focusNode,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Type a message",
                                  prefixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _focusNode.unfocus();
                                          showemoji = !showemoji;
                                        });
                                      },
                                      icon: Icon(showemoji
                                          ? Icons.keyboard
                                          : Icons.emoji_emotions_outlined)),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          print("hi");
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (builder) => menu());
                                        },
                                        icon: Icon(Icons.attach_file),
                                      ),
                                      Icon(Icons.camera_alt)
                                    ],
                                  ))),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 5),
                      //   child: CircleAvatar(
                      //     backgroundColor: Color(0xFF075E54),
                      //     radius: 15,
                      //     child: Icon(Icons.send),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF075E54),
                          radius: 25,
                          child: Icon(showSend ? Icons.send : Icons.mic),
                        ),
                      )
                    ],
                  ),
                  showemoji ? selectEmoji() : Container(),
                ],
              ))
        ]),
      ),
    );
  }

  Widget menu() {
    return Container(
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconGen(Icon(Icons.insert_drive_file), Colors.indigo,
                        'Document', () {
                      print("Document pressed");
                    }),
                    iconGen(Icon(Icons.camera_alt), Colors.pink, 'Camera', () {
                      print("camera");
                    }),
                    iconGen(Icon(Icons.insert_photo), Colors.purple, 'Gallery',
                        () {
                      print("photo");
                    }),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    iconGen(Icon(Icons.headset), Colors.orange, 'Audio', () {}),
                    iconGen(Icon(Icons.location_pin), Colors.teal, 'Location',
                        () {}),
                    iconGen(Icon(Icons.person), Colors.blue, 'Contact', () {}),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget iconGen(Icon icon, Color color, String text, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: icon,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }

  Widget selectEmoji() {
    return EmojiPicker(
        // recommendedKeywords:['racing','horse'],
        onEmojiSelected: (emoji, category) {
      messageController.text = emoji.emoji;
      print(emoji.emoji);
      print(category);
    });
  }
}
