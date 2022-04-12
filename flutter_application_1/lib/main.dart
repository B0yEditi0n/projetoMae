import 'dart:js';

import 'package:flutter/material.dart';

//Telas separadas
import 'TelaLogin.dart';
import 'TelaCadastro.dart';
import 'libary_funcão.dart';
import 'TelaPrincipal.dart';

//Função de inicial de chamada feito em dart
void main() {
  runApp(MaterialApp(
    title: "Tela de Login",
    debugShowCheckedModeBanner: false,

    initialRoute: '/loginTela',
    routes: {
      '/loginTela': (context) => loginTela(),
      '/cadastroTela': (context) => const TelaCadastro(),
      '/telaPrincipal': (context) => const TelaPrincipal(),
    },

    //home: loginTela(),
  ));
}
