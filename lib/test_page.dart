import 'package:flutter/material.dart';
import 'core/api/api_client.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  Future<String> getServerData() async {
    const url = String.fromEnvironment('API_URL');
    print("디버깅 - 현재 설정된 API 주소: $url");

    final response = await ApiClient.instance.get('/test-contents');
    return response.data.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CloneKeep')),
      body: FutureBuilder<String>(
        future: getServerData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return Center(child: Text(snapshot.data!));
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
