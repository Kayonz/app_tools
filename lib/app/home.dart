import 'package:vagner_prova/app/cadastro.dart';
import 'package:vagner_prova/app/segunda_tela.dart';
import 'package:vagner_prova/app/terceira_tela.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  void _login() {
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if (email.isEmpty || senha.isEmpty) {
      // Se o email ou a senha estiverem vazios, exiba um diálogo de erro
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro de Login'),
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
      // Se os campos estiverem preenchidos, navegue para a tela de destino (TerceiraTela)
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TerceiraTela(title: "Calculadora")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Tela de Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _login,
                child: Text('LOGIN'),
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CadastroScreen()),
                  );
                },
                child: Text('CADASTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
