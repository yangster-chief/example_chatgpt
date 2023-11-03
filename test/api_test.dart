import 'package:example_chatgpt/config/api.dart';
import 'package:flutter_test/flutter_test.dart';

///
/// example_chatgpt
/// File Name: api_test
/// Created by sujangmac on 11/4/23
///
/// Description:
///

void main() {
  test('generateText', () async {
    final response = await generateText('Hello, my name is Bruce');
    print(response);
    expect(response, isNotEmpty);
  });
}
