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

    
    try {
      isTyping.value = true;
    print("Entré dans le chatbot");
      final Response = await http.post(
        Uri.parse("https://monlikoun-api.onrender.com/chatbot"),
        headers: {'Content-Type': 'application/json'},

        body: jsonEncode({
          "prompt": message.text
        
        }),
      );

print("Requête envoyée au chatbot");
print("Statut de la réponse : ${Response.statusCode}");
      final data = jsonDecode(Response.body);
print("Réponse du chatbot : ${data["answer"]}");

      ChatMessage reponse = ChatMessage(
        user: bot,
        createdAt: DateTime.now(),
        text: data["answer"],
      );
print("Message envoyé par le chatbot : ${reponse.text}");
      messages.insert(0, reponse);
    } catch (e) {
      ChatMessage erreur = ChatMessage(
        user: bot,
        createdAt: DateTime.now(),
        text: "Une erreur s'est produite 😕",
      );
      messages.insert(0, erreur);
    }finally {
      isTyping.value = false;
    }
  }
}
