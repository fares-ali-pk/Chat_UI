import 'dart:ui';

import 'package:chat/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  User _user;

  ChatScreen(this._user, {Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget._user.name,
          style: const TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              size: 30.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _bodyScreen(),
          _tailScreen(),
        ],
      ),
    );
  }

  Widget _bodyScreen() {
    return Expanded(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          margin: const EdgeInsets.only(top: 8.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 8.0),
                itemCount: messages.length,
                reverse: true,
                controller: _scrollController,
                itemBuilder: (context, indix) {
                  final Message message = messages[indix];
                  final bool isMe = message.sender.id == currentUser.id;
                  return _buildMessage(message, isMe);
                }),
          ),
        ),
      ),
    );
  }

  Widget _tailScreen() {
    return Container(
      color: Colors.white,
      child: Container(
        height: 60.0,
        margin: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value){},
                decoration: const InputDecoration.collapsed(
                  hintText: "Send a message ...",
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send),
              iconSize: 25.0,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message, bool isMe) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          padding: const EdgeInsets.only(
              left: 20.0, top: 12.0, bottom: 12.0, right: 20.0),
          margin: isMe
              ? const EdgeInsets.only(bottom: 8.0, left: 90.0)
              : const EdgeInsets.only(
                  bottom: 8.0,
                ),
          color: isMe ? const Color(0xFFFEF9EB) : const Color(0xFFFFEFEE),
          decoration: BoxDecoration(
            color:  isMe ? Color(0xFFFEF9EB) : Color(0xFFFFEFEE),
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
          ),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.time,
                style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                message.text,
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        isMe
            ? Container()
            : IconButton(
                onPressed: () {},
                icon: message.isLiked
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
                iconSize: 30,
                color: message.isLiked
                    ? Theme.of(context).primaryColor
                    : Colors.blueGrey,
              )
      ],
    );
  }
}
