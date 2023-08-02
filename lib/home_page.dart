import 'package:flutter/material.dart';
import 'login_page.dart';
import 'subject_pronouns_test.dart';
import 'object_pronouns_test.dart';
import 'possessive_adjectives_test.dart';
import 'possessive_pronouns_test.dart';
import 'reflexive_pronouns_test.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PopupMenuButton<String>(
              icon: Icon(Icons.menu), // Ícone do menu padrão
              onSelected: (value) {
                switch (value) {
                  case 'Home':
                    Navigator.pushReplacementNamed(context, '/home');
                    break;
                  case 'Subject Pronouns':
                    Navigator.pushReplacementNamed(
                        context, '/subject_pronouns_test');
                    break;
                  case 'Object Pronouns':
                    Navigator.pushReplacementNamed(
                        context, '/object_pronouns_test');
                    break;
                  case 'Possessive Adjectives':
                    Navigator.pushReplacementNamed(
                        context, '/possessive_adjectives_test');
                    break;
                  case 'Possessive Pronouns':
                    Navigator.pushReplacementNamed(
                        context, '/possessive_pronouns_test');
                    break;
                  case 'Reflexive Pronouns':
                    Navigator.pushReplacementNamed(
                        context, '/reflexive_pronouns_test');
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  'Home',
                  'Subject Pronouns',
                  'Object Pronouns',
                  'Possessive Adjectives',
                  'Possessive Pronouns',
                  'Reflexive Pronouns'
                ].map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
            Text(
              'Menu', // Texto "Menu" ao lado do ícone
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Image.asset(
              'assets/images/sol.jpg',
              width: 400,
              height: 400,
            ),
          ],
        ),
      ),
    );
  }
}
