import 'package:example_chatgpt/config/api.dart';
import 'package:flutter/material.dart';

///
/// example_chatgpt
/// File Name: my_home_page
/// Created by sujangmac on 11/4/23
///
/// Description:
///
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textController = TextEditingController();
  String _responseText = "API 응답이 여기에 표시됩니다.";
  bool _isLoading = false; // 로딩 상태를 추적하는 플래그

  void callGenerateText() async {
    setState(() {
      _isLoading = true; // API 호출이 시작되면 로딩 상태를 true로 설정합니다.
    });
    if (_textController.text.isNotEmpty) {
      try {
        final response = await generateText(_textController.text);
        setState(() {
          _responseText = response;
        });
      } catch (e) {
        setState(() {
          _responseText = "에러가 발생했습니다: $e";
        });
      }
    }
    setState(() {
      _isLoading = false; // API 호출이 끝나면 로딩 상태를 false로 설정합니다.
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Interaction Demo'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textController,
                ),
                ElevatedButton(
                  onPressed: callGenerateText,
                  child: const Text('제출'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator() // 로딩 인디케이터를 보여줍니다.
                    : Text(_responseText),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
