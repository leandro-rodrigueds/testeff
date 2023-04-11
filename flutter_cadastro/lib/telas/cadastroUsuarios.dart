import 'package:flutter/material.dart';
import 'package:flutter_cadastro/componetes/bloco_usuario.dart';
import 'package:flutter_cadastro/modelos/usuario.dart';
import 'package:flutter_cadastro/rotas/rotas_app.dart';
import 'package:provider/provider.dart';
import '../provider/metodos_usuario.dart';
//ALT + Shift + f para organizar o codigo

class CadastroUsuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MetodosUsuarios usuarios = Provider.of<MetodosUsuarios>(context);

    const _currentindex = 0;

    void _onItemTapped(int index) {
      if (_currentindex != 0) {
        if (index == 0) {
          Navigator.of(context).pushNamed(RotasApp.ESTCID);
        }
      }

      if (index == 1) {
        Navigator.of(context).pushNamed(RotasApp.FORMULARIO);
      }

      if (index == 2) {
        Navigator.of(context).pushNamed(RotasApp.CONFIG);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Alunos'),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(RotasApp.FORMULARIO);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: usuarios.count,
        itemBuilder: (ctx, i) => BlocoUsuario(usuarios.byIndex(i)),
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
