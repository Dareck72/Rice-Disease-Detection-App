import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class chatController extends GetxController {
  ChatUser moi = ChatUser(id: '1', firstName: "Farmer");

  ChatUser bot = ChatUser(id: '2', firstName: 'Bot');

  RxList<ChatMessage> messages = <ChatMessage>[].obs;

  RxBool isTyping = false.obs;

  void onSend(ChatMessage message) async {
    messages.insert(0, message);

    isTyping.value = true;

    try {
      final Response = await http.post(
        Uri.parse(""),
        headers: {'Content-Type': 'application/json'},

        body: jsonEncode({}),
      );

      final data = jsonDecode(Response.body);
      
       ChatMessage reponse = ChatMessage(
        user: bot,
        createdAt: DateTime.now(),
        text: data['content'][0]['text'],
      );

      messages.insert(0, reponse);



    } catch (e) {

       ChatMessage erreur = ChatMessage(
        user: bot,
        createdAt: DateTime.now(),
        text: "Une erreur s'est produite 😕",
      );
      messages.insert(0, erreur);

    }
  }
}
