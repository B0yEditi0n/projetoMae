import 'package:flutter/material.dart';
import 'package:tails_mommy/libary_funcao.dart';

class Contribua extends StatefulWidget {
  const Contribua({Key? key}) : super(key: key);

  @override
  State<Contribua> createState() => _ContribuaState();
}

class _ContribuaState extends State<Contribua> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraMenuWidget("Contribua Com o Projeto"),
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children: <Widget>[
                //Image.asset("lib/imagens/pixSupportUs.jfif",
                //    scale: 1.8, fit: BoxFit.fitWidth),
                //Espaço entre entre barra e o icone
                const SizedBox(height: 30),
                textoTitulo('Colabore com qualquer valor!', Colors.white),
                const SizedBox(height: 20),
                textoPadrao(
                    'Ajude-nos a terminar o nosso projeto extremamente caro doando um valor simbólico. Você estará dando visibilidade para desenvolvedores pequenos',
                    Colors.grey),
                const Icon(Icons.heart_broken)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
