import 'main.dart';

import 'package:flutter/material.dart';

//FUNÇÕES DA APLICAÇÃO
widgetDialogo(msgExter, msgInter, escondido) {
  return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: msgInter,
        label: msgExter,
      ));
}

//BARAR PRINCIPAL

barraMenuWidget(titulo, voltar) {

    return AppBar(
      backgroundColor: Colors.white,

      //Para mudar a cor do IconButton basta usar essa linha;
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        titulo,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }
