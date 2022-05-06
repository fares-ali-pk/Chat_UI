import 'package:chat/models/message_model.dart';
import 'package:chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavContacts extends StatefulWidget {
  const FavContacts({Key? key}) : super(key: key);

  @override
  State<FavContacts> createState() => _FavContactsState();
}

class _FavContactsState extends State<FavContacts> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          _topRaw(),
          _bodyRow(),
        ],
      ),
    );
  }

  Widget _topRaw() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Favorite Contacts",
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.blueGrey,
              size: 30.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyRow() {
    return Container(
      height: 120.0,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: favorites.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, indix) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(favorites[indix]),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(favorites[indix].imageUrl),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      favorites[indix].name,
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
