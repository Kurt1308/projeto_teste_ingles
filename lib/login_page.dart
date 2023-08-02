import 'package:flutter/material.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Login'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}
