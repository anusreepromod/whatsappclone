import 'package:flutter/material.dart';

import 'package:whatsapp_clone/models/widgets/utility_widgets.dart';
import 'package:whatsapp_clone/screen/chat_detail_screen.dart';

import '../chat_model.dart';

class Chattile extends StatefulWidget {
  Chattile({Key? key, required this.data}) : super(key: key);
  Chat data;
  @override
  _ChattileState createState() => _ChattileState();
}

class _ChattileState extends State<Chattile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChatDetailScreen(data: widget.data))),
      child: ListTile(
        leading: CircleAvatar(
            radius: 20,
            child: widget.data.isGroup == true ? Text("A") : Text("B")),
        // child: SvgPicture.asset(widget.data.isGroup == true
        //     ? "assets/svg/groups_black_24dp.svg"
        //     : "assets/svg/face_black_24dp.svg"),
        // ),
        //   child: widget.data.avatar == ""
        //       ? SvgPicture.asset(widget.data.isGroup == true
        //           ? "assets/svg/groups_black_24dp.svg"
        //           : "assets/svg/person_black_24dp.svg")
        //       : Image.network(
        //           "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50"),
        // ),
        title: Text(
          widget.data.name.toString(),
          style: TextStyle(
              fontFamily: "ZenKurenaido-Regular", fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.done_all,
              color: Colors.blue,
            ),
            Utilitywidget().heightSpacer(10),
            Flexible(
              child: Text(
                widget.data.message.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontFamily: "ZenKurenaido-Regular"),
              ),
            ),
          ],
        ),
        trailing: Text("6pm"),
      ),
    );
  }
}
