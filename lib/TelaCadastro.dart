import 'package:flutter/material.dart';
import 'libary_funcao.dart';
import 'TelaPrincipal.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({Key? key}) : super(key: key);

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  @override

  //Variavel de Cadastro
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtSenha_ = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),

      //Barra do menu

      appBar: barraMenuWidget("Cadastro de Usuário"),

      //corpo
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              const SizedBox(height: 30),

              //Icone de Usuário
              const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 120,
              ),
              const SizedBox(
                height: 30,
              ),

              widgetDialogo(
                  "Nome de Usuário", "Digite Seu Nome", txtNome, false),
              const SizedBox(height: 30),

              //Email de Usuário
              widgetDialogo(
                  "Digite o Email", "exmplo@email.com", txtEmail, false),

              const SizedBox(height: 30),

              //Senha
              widgetDialogo("Digite a Senha", "", txtSenha, true),

              const SizedBox(height: 30),

              //Confirmaação de Senha
              widgetDialogo("Confirme a Senha", "", txtSenha_, true),

              const SizedBox(height: 30),

              //Botão de Completar Ação
              SizedBox(
                height: 50,
                width: 150,
                child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.black,
                      backgroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      criarConta(
                          context, txtNome.text, txtEmail.text, txtSenha.text);
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaPrincipal()));
                    },
                    child: const Text("Cadastrar")),
              ),
              //FIM DO CÓDIGO
            ]),
          ),
        ),
      ),
    );
  }
}
