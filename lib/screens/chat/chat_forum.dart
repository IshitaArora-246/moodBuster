import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:moodbuster/constants/textStyle.dart';
import 'package:moodbuster/database/database.dart';
import 'package:moodbuster/models/UserModel.dart';
import 'package:moodbuster/screens/chat/profile.dart';
import 'package:moodbuster/screens/no_chat_access.dart';
import 'package:provider/provider.dart';

class ChatForum extends StatefulWidget {
  ChatForum({Key key}) : super(key: key);

  @override
  _ChatForumState createState() => _ChatForumState();
}

class _ChatForumState extends State<ChatForum> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var userUid = Provider.of<UserModel>(context).uid;
    // bool isValidUser = userUid != null;

    return userUid != null
        ? Scaffold(
            backgroundColor: lightskin.withOpacity(0.8),
            body: Stack(
              children: [
                Row(
                  children: [
                    Container(
                      width:
                          screenWidth > 815 ? screenWidth * 0.75 : screenWidth,
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.12,
                          left: 50,
                          right: 50,
                          bottom: screenHeight * 0.1),
                      child: Column(
                        children: [
                          Expanded(
                              child: StreamBuilder<Object>(
                                  stream: DatabaseService().getChats(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      QuerySnapshot querySnapshot =
                                          snapshot.data;
                                      List<QueryDocumentSnapshot> chats =
                                          querySnapshot.docs;
                                      return ListView.builder(
                                          reverse: true,
                                          itemCount: chats.length,
                                          itemBuilder: (context, index) {
                                            bool isSenderMessage =
                                                chats[index]["uid"] == userUid;
                                            Map<String, dynamic> chat =
                                                chats[index].data();
                                            return SenderMessage(
                                                isSenderMessage:
                                                    isSenderMessage,
                                                chat: chat);
                                          });
                                    } else {
                                      return Container(
                                        child: Center(
                                          child: SpinKitCircle(
                                            color: Colors.brown,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                  })),
                          SizedBox(height: 10),
                          MessageField()
                        ],
                      ),
                    ),
                    Spacer(),
                    screenWidth > 815 ? ProfileSection() : SizedBox()
                  ],
                )
              ],
            ))
        : NoChatAccess();
  }
}

class SenderMessage extends StatelessWidget {
  const SenderMessage({
    Key key,
    @required this.chat,
    @required this.isSenderMessage,
  }) : super(key: key);

  final bool isSenderMessage;
  final Map<String, dynamic> chat;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final date = DateTime.fromMillisecondsSinceEpoch(chat["createdAt"]);
    final formattedDate = DateFormat.Hm().format(date);

    return Align(
      alignment: isSenderMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(2.2),
        child: Container(
            padding: EdgeInsets.all(10),
            constraints: BoxConstraints(
              maxWidth: screenWidth * 0.4,
            ),
            decoration: BoxDecoration(
                color: isSenderMessage ? tan.withOpacity(0.8) : Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft:
                        isSenderMessage ? Radius.circular(15) : Radius.zero,
                    bottomRight:
                        !isSenderMessage ? Radius.circular(15) : Radius.zero,
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: RichText(
                textAlign: isSenderMessage ? TextAlign.end : TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(
                      text: isSenderMessage ? "You\n" : "${chat["name"]}\n",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: "${chat["text"]}\n",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 13)),
                  TextSpan(
                      text: formattedDate,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[850])),
                ]))),
      ),
    );
  }
}

class MessageField extends StatefulWidget {
  const MessageField({
    Key key,
  }) : super(key: key);

  @override
  _MessageFieldState createState() => _MessageFieldState();
}

class _MessageFieldState extends State<MessageField> {
  TextEditingController messageController = TextEditingController();
  bool isButtonDisabled = true;

  String userName = "";

  @override
  void initState() {
    super.initState();
    setName();
  }

  setName() async {
    userName = await DatabaseService().getName();
    print("initState: $userName");
  }

  @override
  Widget build(BuildContext context) {
    var userUid = Provider.of<UserModel>(context).uid;

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: messageController,
            onChanged: (value) {
              if (value.length == 0) isButtonDisabled = true;
              if (value.length > 0) isButtonDisabled = false;
              setState(() {});
            },
            decoration: InputDecoration(
              hintText: "Type a message",
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: tan)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: tan.withOpacity(0.6))),
            ),
          ),
        ),
        IconButton(
            icon: Icon(Icons.send),
            color: tan,
            onPressed: isButtonDisabled
                ? null
                : () {
                    setState(() {});

                    DatabaseService()
                        .sendMessage(userName, messageController.text, userUid);
                    messageController.clear();
                  })
      ],
    );
  }
}
