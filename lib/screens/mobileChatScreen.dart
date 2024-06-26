import 'package:flutter/material.dart';
import 'package:upchat/colors.dart';
import 'package:upchat/info.dart';
import 'package:upchat/widgets/chatList.dart';

class MobileChatScreen extends StatelessWidget {
  const MobileChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          info[0]['name'].toString(),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Expanded(
            child: ChatList(),
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: mobileChatBoxColor,
              prefixIcon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.emoji_emotions, color: Colors.grey,),
              ),
              hintText: 'Type a message!',
              hintStyle: const TextStyle(color: Colors.white),
              suffixIcon: Container(
                width: 80,
                child: Row(
                    children: const [
                      Icon(Icons.camera_alt, color: Colors.grey,),
                      Icon(Icons.attach_file, color: Colors.grey,),
                      Icon(Icons.money, color: Colors.grey,),
                    ],
                  ),
              ),
              // suffixIcon: Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: const [
              //       Icon(Icons.camera_alt, color: Colors.grey,),
              //       Icon(Icons.attach_file, color: Colors.grey,),
              //       Icon(Icons.money, color: Colors.grey,),
              //     ],
              //   ),
              // ),
              
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: const BorderSide(
                  width: 2,
                  style: BorderStyle.none,
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    );
  }
}