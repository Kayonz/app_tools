import 'package:vagner_prova/app/segunda_tela.dart';
import 'package:vagner_prova/app/terceira_tela.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'home.dart';
class SobreHome extends StatefulWidget {
  const SobreHome({super.key, required this.title});

  final String title;

  @override
  _SobreHomeState createState() => _SobreHomeState();
}

class _SobreHomeState extends State<SobreHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey, // Use Colors.red para vermelho
              ),
              child: Text('Lista de Abas para você visitar'),
            ),
            ListTile(
              title: const Text('Sobre'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SobreHome(title: "Sobre")),
                );
              },
            ),
            ListTile(
              title: const Text('Calculadora'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TerceiraTela(title: "Calculadora")),
                );
              },
            ),
            ListTile(
              title: const Text('Sair'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "Sobre")),
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem vindo ao App favorito dos Gremista, Dale Grêmio!',
              style: TextStyle(
                fontSize: 24, // Tamanho da fonte desejado
                fontWeight: FontWeight.bold, // Pode ajustar o estilo da fonte conforme necessário
              ),
            ),
            SizedBox(height: 10),
            Transform.scale(
              scale: 0.9,
              child: Image.asset('img/logo_brahma.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}
