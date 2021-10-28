import 'package:flutter/material.dart';
import 'package:whatsapp_clone/pages/chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, initialIndex: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff075e54),
        title: Text("Whatsapp"),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: const Icon(Icons.search),
                  tooltip: 'Open shopping cart',
                  onPressed: () => print('tapped')),
              // SizedBox(
              //   width: 10,
              // ),

              PopupMenuButton(itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("New Group"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("New Broadcast"),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text("Linked Devices"),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text("Starred messages"),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text("Payment"),
                    value: 5,
                  ),
                  PopupMenuItem(
                    child: Text("Settings"),
                    value: 6,
                  ),
                ];
              }, onSelected: (value) {
                print(value);
              }),
            ],
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(icon: Icon(Icons.camera)),
            Tab(icon: Text("CHATS")),
            Tab(icon: Text("STATUS")),
            Tab(icon: Text("CALLS"))
          ],
        ),
      ),
      body: TabBarView(
        children: [Text("Camera"), ChatPage(), Text("Status"), Text("Calls")],
        controller: _controller,
      ),
    );
  }
}
