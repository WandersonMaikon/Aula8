import 'package:flutter/material.dart';
import 'api_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Requisição POST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController();
  final ApiService _apiService = ApiService();

  _sendData() async {
    if (_controller.text.isNotEmpty) {
      Map<String, dynamic> data = {
        'title': _controller.text,
        'body': 'Exemplo de body',
        'userId': 1,
      };
      try {
        var response = await _apiService.createPost!(data);
        print(response);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requisição POST'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Título do Post'),
            ),
            ElevatedButton(
              onPressed: _sendData,
              child: Text('Enviar'),
            )
          ],
        ),
      ),
    );
  }
}
