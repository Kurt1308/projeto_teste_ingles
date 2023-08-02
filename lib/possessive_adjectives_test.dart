import 'package:flutter/material.dart';
import 'home_page.dart';

class PossessiveAdjectivesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de Possessive Adjectives'),
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
