import 'package:vagner_prova/app/terceira_tela.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'home.dart';

class SegundaTela extends StatefulWidget {
  const SegundaTela({super.key, required this.title});
  final String title;
  @override
  State<SegundaTela> createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:  ListView(
          //teste de comentario
          //padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey, // Use Colors.red para vermelho
              ),
              child: Text('AA'),
            ),

            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "Sobre")),
                );
              },
            ),

            ListTile(
              title: const Text('Item 2'),
              onTap: () {

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


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
