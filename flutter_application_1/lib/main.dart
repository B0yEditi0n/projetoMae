import 'package:flutter/material.dart';
import 'package:flutter_application_1/funcionalidades/bloqueioAparelho.dart';
import 'package:flutter_application_1/funcionalidades/detalhes_usuario.dart';
import 'package:flutter_application_1/funcionalidades/sobreNos.dart';

//Telas separadas
import 'TelaLogin.dart';
import 'TelaCadastro.dart';
import 'TelaPrincipal.dart';

//Funcionalidades Telas
import 'package:flutter_application_1/funcionalidades/listaUsuarios.dart';
import 'package:flutter_application_1/funcionalidades/listaUsuarios.dart';
import 'package:flutter_application_1/funcionalidades/configuracoesUsuario.dart';
import 'package:flutter_application_1/funcionalidades/ConfTela.dart';
import 'package:flutter_application_1/funcionalidades/contribua.dart';

//Função de inicial de chamada feito em dart
void main() {
  runApp(MaterialApp(
    title: "",
    debugShowCheckedModeBanner: false,

    initialRoute: '/loginTela',
    routes: {
      '/loginTela': (context) => loginTela(),
      '/cadastroTela': (context) => const TelaCadastro(),
      '/telaPrincipal': (context) => const TelaPrincipal("Usuário 1"),
      '/listadeusuarios': (context) => const ListaUsuarios(),
      '/detalhesContaUsuario': (context) => const detalhesContaUsuario(),
      '/configurausu' : (context) => const configuraUsuario(),
      '/bloqueioAparelho' : (context) => const BloqueioAparelho(),
      '/sobreNos' : (context) => const SobreNos(),
      '/configuraTela' : (context) => const ConfigTela(),
      '/contribua' : (context) => const Contribua(),
    },

    //home: loginTela(),
  ));
}
