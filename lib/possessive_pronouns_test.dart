import 'package:flutter/material.dart';
import 'home_page.dart';

class PossessivePronounsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de Possessive Pronouns'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Icon(Icons.home),
        tooltip: 'Voltar para a página Home',
      ),
    );
  }
}
