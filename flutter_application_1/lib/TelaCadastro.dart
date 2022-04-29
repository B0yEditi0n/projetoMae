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

  //Variavel do nome do usuario
  var nomeUsuario = TextEditingController();

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
                  "Nome de Usuário", "Digite Seu Nome", nomeUsuario, false),
              const SizedBox(height: 30),

              //Email de Usuário
              widgetDialogo("Digite o Email", "exmplo@email.com", null, false),

              const SizedBox(height: 30),

              //Confirmação do Email do Usuário
              widgetDialogo(
                  "Cofirme o Email", "exemplo@email.com", null, false),

              const SizedBox(height: 30),

              //Senha
              widgetDialogo("Digite a Senha", "", null, true),

              const SizedBox(height: 30),

              //Confirmaação de Senha
              widgetDialogo("Confirme a Senha", "", null, true),

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
                      if (nomeUsuario.text == ""){
                        nomeUsuario.text = "";
                      }
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TelaPrincipal(
                                    nomeUsuario.text,
                                  )));
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
