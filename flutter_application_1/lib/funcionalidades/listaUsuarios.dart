import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dados_usuarios/UsuariosBd.dart';

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({ Key? key }) : super(key: key);

  @override
  State<ListaUsuarios> createState() => LlistUsuariosState();
}

class LlistUsuariosState extends State<ListaUsuarios> {
  // Lista Dinâmica contendo objetos da classe UsuariosBd
  List<UsuariosBd> lista = [];

  // CARREGAR UM ARQUIVO JSON
  carregarJson() async {
    final String arquivo =
        await rootBundle.loadString('lib/dados_usuarios/UsuariosBd.json');
    final dynamic data = await json.decode(arquivo);

    //percorrer o arquivo
    setState(() {
      data.forEach((item) {
        lista.add(UsuariosBd.fromJson(item));
      });
    });
  }

  // Inicialização da UI e leitura do arquivo JSON
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await carregarJson();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contas Ativas'),
        backgroundColor: const Color.fromARGB(255, 20, 40, 70),
      ),
      backgroundColor: Colors.white24,

      // Exibe elementos da lista
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                lista[index].nome,
                style: const TextStyle(fontSize: 28),
              ),
              subtitle: Text(
                  'Hora de Dormir: ${lista[index].horaDormir} / Horário de acordar: ${lista[index].horaAcordar}'),
              leading: const Icon(Icons.nightlight_round),
              trailing: const Icon(Icons.arrow_right),
              onTap: () {
                // NAVEGAÇÃO
                Navigator.pushNamed(context, '/detalhesContaUsuario', arguments: lista[index],);
              },
            );
          },
        ),
      ),
    );
  }
}