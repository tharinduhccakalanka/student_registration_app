import 'package:flutter/material.dart';
import 'package:student_registration_app/screens/main/profile/profile.dart';
import 'package:student_registration_app/screens/widgets/conversations_card.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: const AssetImage(
                        "assets/images/tharindu.jpg",
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Tharindu Akalanka",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Divider(thickness: 0.5, color: Colors.blueGrey),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Chats",
                style: TextStyle(
                    fontSize: 30,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ConversationCard();
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: 10),
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class AssetConstants {
  static const profileImgUrl = "https://example.com/profile.png";
}
