//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'libary_funcao.dart';

class TelaPrincipal extends StatefulWidget {
  final String nomedeusuario;
  const TelaPrincipal(this.nomedeusuario, {Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      //Barra e Menu
      appBar: barraMenuWidget(widget.nomedeusuario),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Column(
            children: <Widget>[
              //Espaço entre entre barra e o icone
              const SizedBox(height: 30),

              //Botão Icone
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listadeusuarios');
                },
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 120,
                ),
                iconSize: 120,
              ),

              const SizedBox(
                height: 30,
              ),

              //Botão do Nome do Usuário
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/listadeusuarios');
                },
                child: Text(
                  widget.nomedeusuario,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: "Arial",
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 20,
                thickness: 5,
                indent: 20,
                endIndent: 0,
                color: Colors.white,
              ),

              //COMEÇA O MENU
              const SizedBox(height: 20),

              //Botão de Configurações do Usuário

              botaoMenu(Icons.manage_accounts, "Configurações da Conta", '/configurausu', context),

              const SizedBox(height: 20),

              //Configuações da Tela
              botaoMenu(Icons.settings_cell, "Opções de Tela", '/configuraTela', context),

              const SizedBox(height: 20),

              //Configurações do Bloqueio
              botaoMenu(Icons.settings_rounded, "Bloqueio do Aparelho", '/bloqueioAparelho', context),

              const SizedBox(height: 20),

              //Suport US
              botaoMenu(Icons.paypal, "Contribua Conosco", '/contribua', context),                    
              
              const SizedBox(height: 20),

              //Sobre nós
              botaoMenu(Icons.handshake, "Sobre Nós", '/sobreNos', context),
            ],
          ),
        ),
      ),
    );

    //Icone de Usuário

    //Email da Conta
  }
}
