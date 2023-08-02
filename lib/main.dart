import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:projeto_teste_ingles/home_page.dart' as home_page;
import 'subject_pronouns_test.dart';
import 'object_pronouns_test.dart';
import 'possessive_adjectives_test.dart';
import 'possessive_pronouns_test.dart';
import 'reflexive_pronouns_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Teste Inglês',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => home_page.HomePage(),
        '/subject_pronouns_test': (context) => SubjectPronounsPage(),
        '/object_pronouns_test': (context) => ObjectPronounsPage(),
        '/possessive_adjectives_test': (context) => PossessiveAdjectivesPage(),
        '/possessive_pronouns_test': (context) => PossessivePronounsPage(),
        '/reflexive_pronouns_test': (context) => ReflexivePronounsPage(),
      },
    );
  }
}
