import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vagner_prova/app/sobre_home.dart';
import 'home.dart';

class TerceiraTela extends StatefulWidget {
  const TerceiraTela({super.key, required this.title});
  final String title;
  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  String output = '0';
  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == '×' ||
        buttonText == '÷') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = '0';
    } else if (buttonText == '=') {
      num2 = double.parse(output);
      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == '×') {
        _output = (num1 * num2).toString();
      }
      if (operand == '÷') {
        if (num2 != 0) {
          _output = (num1 / num2).toString();
        } else {
          _output = 'Erro';
        }
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(24.0),
              backgroundColor: Color.fromARGB(255, 100, 96, 102)),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 42.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildYellowButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(24.0),
              backgroundColor: Color.fromARGB(255, 225, 181, 35)),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 42.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildRedButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(24.0),
              backgroundColor: Color.fromARGB(255, 224, 18, 18)),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 42.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child:  ListView(
          //teste de comentario
          //padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey, // Use Colors.red para vermelho
              ),
              child: Text('Siga a lista de Abas que você pode ver'),
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
        automaticallyImplyLeading:  true,
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              output,
              style: TextStyle(
                  fontSize: 70.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton('7'),
                  buildButton('8'),
                  buildButton('9'),
                  buildYellowButton('÷'),
                ],
              ),
              Row(
                children: [
                  buildButton('4'),
                  buildButton('5'),
                  buildButton('6'),
                  buildYellowButton('×'),
                ],
              ),
              Row(
                children: [
                  buildButton('1'),
                  buildButton('2'),
                  buildButton('3'),
                  buildYellowButton('-'),
                ],
              ),
              Row(
                children: [
                  buildButton('0'),
                  buildRedButton('C'),
                  buildButton('='),
                  buildYellowButton('+'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
