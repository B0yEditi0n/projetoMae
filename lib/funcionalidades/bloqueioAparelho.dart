import 'package:flutter/material.dart';
import 'package:tails_mommy/libary_funcao.dart';

class BloqueioAparelho extends StatefulWidget {
  const BloqueioAparelho({ Key? key }) : super(key: key);

  @override
  State<BloqueioAparelho> createState() => _BloqueioAparelhoState();
}

class _BloqueioAparelhoState extends State<BloqueioAparelho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraMenuWidget("Bloqueio do Aparelho"),
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20), 
          child: Column(children: [
            
            const SizedBox(height: 30),
            const Divider(
                  height: 50,
                  thickness: 2,
                  indent: 400,
                  endIndent: 400,
                  color: Colors.grey,
            ),
            textoTitulo("Tipos de Bloqueio", Colors.white),
            const SizedBox(height: 20),
            
            botaoMenu(Icons.star_border, 'Sugestivo', null, context),
            const SizedBox(height: 20),

            botaoMenu(Icons.star_half, 'Parcial', null, context),
            const SizedBox(height: 20),

            botaoMenu(Icons.star, 'Total', null, context),
            const SizedBox(height: 20)

          ]),
        ),
        ),
      
    );
  }
}
