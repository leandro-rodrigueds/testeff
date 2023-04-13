import 'package:flutter/material.dart';
import 'package:flutter_cadastro/componetes/bloco_usuario.dart';
import 'package:flutter_cadastro/modelos/usuario.dart';
import 'package:flutter_cadastro/rotas/rotas_app.dart';
import 'package:provider/provider.dart';
import '../provider/metodos_usuario.dart';
//ALT + Shift + f para organizar o codigo

class Configuracoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TrataUsuario usuarios = Provider.of<TrataUsuario>(context);

    const _currentindex = 2;

    void _onItemTapped(int index) {
      if (_currentindex != 2) {
        if (index == 2) {
          Navigator.of(context).pushNamed(RotasApp.CONFIG);
        }
      }

      if (index == 1) {
        Navigator.of(context).pushNamed(RotasApp.FORMULARIO);
      }

      if (index == 0) {
        Navigator.of(context).pushNamed(RotasApp.ALUNOS);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Center(
        child: Text('Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2), label: 'Cadastro Usuário'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Adionar Aluno'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configurações'),
        ],
        onTap: _onItemTapped,
        selectedItemColor: Color.fromARGB(255, 31, 114, 34),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
