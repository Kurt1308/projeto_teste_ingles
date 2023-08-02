import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _isButtonDisabled = true;

  void _validateFields() {
    setState(() {
      _isButtonDisabled =
          _usuarioController.text.isEmpty || _senhaController.text.isEmpty;
    });
  }

  void _cadastrar() async {
    final newUser = _usuarioController.text;
    final newSenha = _senhaController.text;

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user', newUser);
    prefs.setString('senha', newSenha);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cadastro'),
        content: Text('Usuário e senha cadastrados com sucesso!'),
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

    _usuarioController.clear();
    _senhaController.clear();
    _validateFields();
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
              labelText: 'Novo Usuário',
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
              labelText: 'Nova Senha',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _isButtonDisabled ? null : _cadastrar,
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
