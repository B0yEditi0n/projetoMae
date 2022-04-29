import 'package:flutter/material.dart';
import 'package:flutter_application_1/libary_funcao.dart';

class SobreNos extends StatefulWidget {
  const SobreNos({Key? key}) : super(key: key);

  @override
  State<SobreNos> createState() => _SobreNosState();
}

class _SobreNosState extends State<SobreNos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraMenuWidget("Sobre Nós"),
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            
            
            
            //foto nossa
            
            Image.asset("lib/imagens/ProgramadoresSuportUs.jpg", scale: 1.8, fit: BoxFit.fitWidth),
            /*Image.asset(
              lib/imagens/bmw_m2.jpg
              imagem,
              scale: 1.8,
              fit: BoxFit.fitWidth,
            ),*/
            
            
            
            const SizedBox(height: 30),
            const Divider(
                  height: 50,
                  thickness: 2,
                  indent: 400,
                  endIndent: 400,
                  color: Colors.grey,
            ),
            textoTitulo("Os desenvolvedores", Colors.white),
            const SizedBox(height: 20),
            textoPadrao('\'Somos humildes garotos de programa à procura de emprego e dipirona.\nNossa maior vocação é desenvolver programas de última hora sem qualquer planejamento.\nTrabalhamos bem sob pressão e nossa hora é paga através de cafeína e terapia!\'', Colors.yellow),
            const SizedBox(height: 10),
            textoPadrao('-Diz Noah Vinicius Aguiar, aluno da Fatec Centro Paula Souza', Colors.grey),
            const SizedBox(height: 80),
            
            textoTitulo("O Aplicativo", Colors.white),
            const SizedBox(height: 20),
            textoPadrao('\'O aplicativo surgiu a partir de uma necessidade tanto minha quanto de milhares de jovens e adultos workaholics que têm problemas em priorizar o sono, comprometendo sua saúde e futuramente gerando vários problemas.\nO app MAMÃE é uma proposta para ajudar essas pessoas através de bloqueios e avisos inteligentes de recursos do disposivito nas horas fundamentais para regularização do sono.\nEsse software tem as opções de avisos em horários noturnos e bloqueios de apps para otimização de tempo do usuário.\'', Colors.yellow),
            const SizedBox(height: 10),
            textoPadrao('-Diz Caio Abreu de Souza, também estudante da Fatec Centro Paula Souza', Colors.grey)
            ]),
        ),
        ),
      
    );
  }
}