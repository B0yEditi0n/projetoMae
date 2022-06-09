import 'dart:collection';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../dados_usuarios/UsuariosBd.dart';

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({Key? key}) : super(key: key);

  @override
  State<ListaUsuarios> createState() => LlistUsuariosState();
}

class LlistUsuariosState extends State<ListaUsuarios> {
  var usuarios;

  // INICIALIZAR
  @override
  void initState() {
    super.initState();
    usuarios = FirebaseFirestore.instance.collection('DadosUsuarios');
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
          child: StreamBuilder<QuerySnapshot>(
            stream: usuarios.snapshot,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(
                      child: Text('Não foi possível conectar.'));
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  final users = snapshot.requireData;
                  return ListView.builder(
                      itemCount: users.size,
                      itemBuilder: (context, index) {
                        return atribuiVariavel(users.docs[index]);
                      });
              }
            },
          )
          /*ListView.builder(
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
                Navigator.pushNamed(
                  context,
                  '/detalhesContaUsuario',
                  arguments: lista[index],
                );
              },
            );
          },
        ),*/
          ),
    );
  }

  atribuiVariavel(dado) {
    String nome = dado.data()['nome'];

    return ListTile(
      title: Text(nome),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/detalhesContaUsuario',
            arguments: dado.id,
          );
        },
      ),
    );
  }
}
