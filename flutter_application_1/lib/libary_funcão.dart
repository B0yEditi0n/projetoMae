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

barraMenuWidget(titulo, voltar, contexto) {
  if (voltar == true) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.pop(contexto);
          },
        )
      ],
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
  } else {
    return AppBar(
      backgroundColor: Colors.white,
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
}
