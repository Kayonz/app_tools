import 'package:flutter/material.dart';
import 'package:vagner_prova/app/terceira_tela.dart'; // Importe a tela de destino

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  String cadastroInfo = ''; // Variável para armazenar os detalhes do cadastro

  void _cadastrar(BuildContext context) {
    String nome = nomeController.text.trim();
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if (nome.isEmpty || email.isEmpty || senha.isEmpty) {
      // Se algum campo estiver vazio, exiba um diálogo de erro
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de Cadastro'),
            content: Text('Por favor, preencha todos os campos.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Se todos os campos estiverem preenchidos, faça o cadastro
      Map<String, dynamic> cadastro = {
        'Nome': nome,
        'Email': email,
        'Senha': senha,
      };

      // Atualize a variável cadastroInfo para exibir os detalhes na tela
      setState(() {
        cadastroInfo = 'Cadastro:\n${cadastro.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _cadastrar(context); // Chame a função de cadastro
              },
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 16.0), // Espaço adicional
            Text(
              cadastroInfo, // Exibir os detalhes do cadastro aqui
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
