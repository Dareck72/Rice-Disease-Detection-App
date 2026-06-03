import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/chatController.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';

class chatView extends GetView<chatController> {
  @override
  Widget build(BuildContext context) {
    Logincontroller logincontroller = Get.find<Logincontroller>();
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          "Chatbot",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 2, 158, 109),
      ),
      body: logincontroller.access_token.isNotEmpty
          ? Obx(
              () => DashChat(
                currentUser: controller.moi,
                onSend: controller.onSend,
                messages: controller.messages,
                typingUsers: controller.isTyping.value ? [controller.bot] : [],
                messageOptions: MessageOptions(
                  currentUserTextColor: Colors.white,
                  currentUserContainerColor: Color.fromARGB(255, 2, 158, 109),
                  containerColor: Colors.grey.shade200,
                  showTime: true,
                     textColor: const Color.fromARGB(255, 192, 26, 26),

    messageTextBuilder:  (
      ChatMessage message,
      ChatMessage? previousMessage,
      ChatMessage? nextMessage,
    ) {
      bool isMe = message.user.id == controller.moi.id;

  return MarkdownBody(
    data: message.text,
    styleSheet: MarkdownStyleSheet(
      p: TextStyle(
        
        color: isMe ? Colors.white : const Color.fromARGB(255, 7, 7, 7),
        fontSize: 16,
      ),
    ),
  );
    },

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
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                   Icon(Icons.wifi_off, size: 50, color: Colors.black),
                   SizedBox(height: 20),
                  Text(
                    "Pas de connexion internet ",
                    style: TextStyle(color: Colors.black, fontSize:20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}
