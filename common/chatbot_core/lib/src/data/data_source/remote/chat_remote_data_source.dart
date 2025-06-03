import 'package:meezy_core/meezy_core.dart';

import '../../data.dart';

abstract interface class ChatDataSource {
  Future<String> generateChatResponse({
    required List<Map<String, String>> conversationHistory,
  });
}

final class ChatDataSourceImpl implements ChatDataSource {
  final RestClient _gptClient;

  static const modelProd = 'google/gemini-2.0-flash-001';
  static const modelTest = 'deepseek/deepseek-r1:free';

  ChatDataSourceImpl({
    required RestClient gptClient,
  }) : _gptClient = gptClient;

  @override
  Future<String> generateChatResponse({
    required List<Map<String, String>> conversationHistory,
  }) async {
    // Request chat completion from the GPT client.
    final responseBody = await _gptClient.post(
      '/v1/chat/completions',
      body: {
        "model": modelProd,
        "messages": conversationHistory,
        "temperature": 0.7,
        "max_tokens": 10000,
      },
    );

    logger.info("Received response from GPT endpoint: $responseBody");

    if (responseBody case final decoded?) {
      final prediction = GptPrediction.fromJson(decoded);
      return prediction.choices.first.message.content;
    }

    throw FormatException(
      'Unexpected response format: $responseBody',
      responseBody,
    );
  }
}
