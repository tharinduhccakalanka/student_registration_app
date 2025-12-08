import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:student_registration_app/utills/app_colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    this.isSender = true,
  });
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        BubbleSpecialThree(
          text: 'Hi there',
          color: isSender ? AppColors.primaryColor : Colors.blueGrey,
          tail: true,
          textStyle: TextStyle(color: Colors.white, fontSize: 16),
          isSender: isSender,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: const Text(
            "1 min ago",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
