import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int delta) {
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Número incorreto!";
      } else if (_people <= 15) {
        _infoText = "Pode entrar!";
      } else {
        _infoText = "Lotado";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "src/mercado.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //para deixar centralizado
          children: <Widget>[
            //widget pai
            Text(
              //caixa de texto
              "Pessoas: $_people",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold), //estilo do texto
            ),
            Row(
              //novo widget linha na horizontal
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      //adicionar botão
                      onPressed: () {
                        _changePeople(1);
                      }, //verificar se foi pressionado
                      child: const Text("+1",
                          style: TextStyle(
                              fontSize: 40.0, color: Colors.white))),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      //adicionar botão
                      onPressed: () {
                        _changePeople(-1);
                      }, //verificar se foi pressionado
                      child: const Text("-1",
                          style: TextStyle(
                              fontSize: 40.0, color: Colors.white))),
                )
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ),
          ],
        )
      ],
    );
  }
}
