import 'package:flutter/material.dart';
import 'package:flutter_application_1/libary_func%C3%A3o.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(23, 23, 23, 1),

      //Barra do menu
      appBar: barraMenuWidget("Casdastro de Usuário", false, context),

      //corpo
      body: Center(
        child: Column(children: const <Widget>[
          SizedBox(height: 30),
          //Icone de Usuário
          Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 120,
          ),
        ]),
      ),
    );
  }
}
