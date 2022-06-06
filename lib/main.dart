import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tails_mommy/funcionalidades/bloqueioAparelho.dart';
import 'package:tails_mommy/funcionalidades/detalhes_usuario.dart';
import 'package:tails_mommy/funcionalidades/sobreNos.dart';

//Telas separadas
import 'TelaLogin.dart';
import 'TelaCadastro.dart';
import 'TelaPrincipal.dart';

//Funcionalidades Telas
import 'package:tails_mommy/funcionalidades/listaUsuarios.dart';
import 'package:tails_mommy/funcionalidades/configuracoesUsuario.dart';
import 'package:tails_mommy/funcionalidades/ConfTela.dart';
import 'package:tails_mommy/funcionalidades/contribua.dart';

import 'firebase_options.dart';

//Função de inicial de chamada feito em dart
Future<void> main() async {
  //Firebase integração
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: "",
    debugShowCheckedModeBanner: false,

    initialRoute: '/loginTela',
    routes: {
      '/loginTela': (context) => loginTela(),
      '/cadastroTela': (context) => const TelaCadastro(),
      '/telaPrincipal': (context) => TelaPrincipal(),
      '/listadeusuarios': (context) => const ListaUsuarios(),
      '/detalhesContaUsuario': (context) => const detalhesContaUsuario(),
      '/configurausu': (context) => const configuraUsuario(),
      '/bloqueioAparelho': (context) => const BloqueioAparelho(),
      '/sobreNos': (context) => const SobreNos(),
      '/configuraTela': (context) => const ConfigTela(),
      '/contribua': (context) => const Contribua(),
    },

    //home: loginTela(),
  ));
}
