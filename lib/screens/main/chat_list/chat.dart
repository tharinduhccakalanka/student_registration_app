import 'package:flutter/material.dart';
import 'package:student_registration_app/screens/main/chat_list/widgets/chat_bubble.dart';
import 'package:student_registration_app/screens/main/chat_list/widgets/message_typing_widget.dart';
import 'package:student_registration_app/screens/main/profile/profile.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: AppColors.primaryColor,
          leadingWidth: 25,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_ios,
                size: 22,
                color: Colors.white,
              )),
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 23,
                        backgroundImage: const AssetImage(
                          "assets/images/tharindu.jpg",
                        ),
                      ),
                      const SizedBox(width: 7),
                      const Text(
                        "Tharindu Akalanka",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Profile(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                //ChatBubble(isSender: false,),  TO show reciver message
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return ChatBubble(
                          isSender: index % 2 == 0,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                      itemCount: 20),
                ),
                MessageTypingWidget(),
              ],
            )));
  }
}
