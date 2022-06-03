import 'package:flutter/material.dart';

import '../dados_usuarios/UsuariosBd.dart';

class detalhesContaUsuario extends StatefulWidget {
  const detalhesContaUsuario({Key? key}) : super(key: key);

  @override
  State<detalhesContaUsuario> createState() => _detalhesContaUsuarioState();
}

class _detalhesContaUsuarioState extends State<detalhesContaUsuario> {
  @override
  Widget build(BuildContext context) {
    // RECUPERAR os dados passados como argumento
    final UsuariosBd u =
        ModalRoute.of(context)!.settings.arguments as UsuariosBd;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações da Conta Ativa'),
        backgroundColor: const Color.fromARGB(255, 20, 40, 70),
      ),
      backgroundColor: Colors.white24,

      //BODY
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(u.nome, style: const TextStyle(fontSize: 28)),
              Text(u.horaAcordar, style: const TextStyle(fontSize: 20)),
              Text(u.horaDormir, style: const TextStyle(fontSize: 20))
            ],
          ),
        ),
      ),

      // Floating Action Button
    );
  }
}
