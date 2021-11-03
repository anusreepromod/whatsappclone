import 'dart:convert';

import 'package:flutter/material.dart';

SingleChat singleChatFromJson(String str) =>
    SingleChat.fromJson(json.decode(str));

String singleChatToJson(SingleChat data) => json.encode(data.toJson());

class SingleChat {
  SingleChat({
    @required this.isSend,
    @required this.isReaded,
    @required this.message,
    @required this.sendAt,
  });

  bool? isSend;
  bool? isReaded;
  String? message;
  String? sendAt;

  factory SingleChat.fromJson(Map<String, dynamic> json) => SingleChat(
        isSend: json["isSend"],
        isReaded: json["isReaded"],
        message: json["message"],
        sendAt: json["sendAt"],
      );

  Map<String, dynamic> toJson() => {
        "isSend": isSend,
        "isReaded": isReaded,
        "message": message,
        "sendAt": sendAt,
      };
}
