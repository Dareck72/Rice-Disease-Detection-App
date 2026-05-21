import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/chatController.dart';

class chatView extends GetView<chatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=>DashChat(currentUser:controller.moi, onSend:controller.onSend , messages: controller.messages,
        typingUsers: controller.isTyping.value ? [controller.bot]: [],

        messageOptions: MessageOptions(
          currentUserContainerColor: Color(0xFF045435),
          containerColor: Colors.grey.shade200,
          showTime: true,
        ),

           inputOptions: InputOptions(
          inputDecoration: InputDecoration(
            hintText: "Écrire un message...",
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),



        
        )
        
      ),
    );
  }
}
