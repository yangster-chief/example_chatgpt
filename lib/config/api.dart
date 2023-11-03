import 'dart:convert';

import 'package:example_chatgpt/config/constants.dart';
import 'package:http/http.dart' as http;

///
/// example_chatgpt
/// File Name: api
/// Created by sujangmac on 11/4/23
///
/// Description:
///
const apiUrl = 'https://api.openai.com/v1/chat/completions';

Future<String> generateText(String prompt) async {
  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $kSecretKey'
    },
    body: jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'system', 'content': 'You are a helpful assistant.'},
        {'role': 'user', 'content': prompt}
      ]
    }),
  );

  Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));

  return data['choices'][0]['message']['content'];
}
