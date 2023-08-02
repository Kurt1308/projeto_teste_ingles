import 'package:flutter/material.dart';
import 'cadastro_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _isButtonDisabled = true;

  void _validateFields() {
    setState(() {
      _isButtonDisabled =
          _usuarioController.text.isEmpty || _senhaController.text.isEmpty;
    });
  }

  void _login() async {
    final prefs = await SharedPreferences.getInstance();
    final savedUser = prefs.getString('user');
    final savedSenha = prefs.getString('senha');

    final enteredUser = _usuarioController.text;
    final enteredSenha = _senhaController.text;

    if (enteredUser == savedUser && enteredSenha == savedSenha) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de login'),
          content: Text('Usuário não cadastrado ou senha incorreta.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _validateFields();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            controller: _usuarioController,
            onChanged: (value) {
              _validateFields();
            },
            decoration: InputDecoration(
              labelText: 'Usuário',
            ),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _senhaController,
            onChanged: (value) {
              _validateFields();
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Senha',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isButtonDisabled ? null : _login,
            child: Text('Login'),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CadastroPage()),
              );
            },
            child: Text('Criar conta'),
          ),
        ],
      ),
    );
  }
}
