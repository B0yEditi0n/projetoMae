import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//Variáveis Globais

//FUNÇÕES DA APLICAÇÃO

//Barra de Entrada de Dados
widgetDialogo(msgExter, msgInter, variavel, oculto) {
  return TextFormField(
      textAlign: TextAlign.center,
      controller: variavel,
      //Esaço do Usuárip

      //Variával que define se o texto é para senhas(ocultas);
      obscureText: oculto,
      decoration: InputDecoration(
          filled: true,
          hintText: msgInter,
          labelText: msgExter,
          fillColor: Colors.white,

          //TAMANHO DAS FONTES
          //EXTERNA
          labelStyle: const TextStyle(fontSize: 20, color: Colors.black),
          hintStyle: const TextStyle(
              fontSize: 20, color: Color.fromARGB(255, 162, 162, 162))));
}

//BARAR PRINCIPAL

barraMenuWidget(titulo) {
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

widgetDialogoSmall(msgExter, msgInter, variavel, oculto) {
  return SizedBox(
    height: 70,
    width: 100,
    child: TextFormField(
        controller: variavel,

        //Variával que define se o texto é para senhas(ocultas);
        obscureText: oculto,
        decoration: InputDecoration(
            filled: true,
            hintText: msgInter,
            labelText: msgExter,
            fillColor: Colors.white,

            //TAMANHO DAS FONTES
            //EXTERNA
            labelStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            hintStyle: const TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 162, 162, 162)))),
  );
}

//Texto Padrão
textoPadrao(texto, cor) {
  return Text(
    texto,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: cor,
      fontSize: 20,
    ),
  );
}

//Texto Título
textoTitulo(texto, cor) {
  return Text(
    texto,
    style: TextStyle(
      color: cor,
      fontSize: 25,
    ),
  );
}

//Botão do Menu
botaoMenu(icone, texto, rota, contexto) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          icone,
          color: Colors.white,
          size: 40,
        ),
        iconSize: 40,
      ),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(contexto, rota);
        },
        child: textoPadrao(
          texto,
          Colors.white,
        ),
      ),
    ],
  );
}

divisor() {
  return const Divider(
    height: 50,
    thickness: 2,
    indent: 200,
    endIndent: 200,
    color: Colors.grey,
  );
}

//Converter em Timestamp

/*
conversaoTimestamp(hora){
  String sdatetime = "2021-12-04";
  DateTime sdate = DateTime.parse(sdatetime);
  int stimestamp = sdate.microsecondsSinceEpoch;
  print(stimestamp);
  
}*/