import 'package:flutter/material.dart';
import 'package:flutter_cadastro/componetes/bloco_usuario.dart';
import 'package:flutter_cadastro/modelos/usuario.dart';
import 'package:flutter_cadastro/rotas/rotas_app.dart';
import 'package:provider/provider.dart';
import '../provider/metodos_usuario.dart';
//ALT + Shift + f para organizar o codigo

class ListaUsuarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Nageva no contesto para pegar para pegar um elemento 
    final TrataUsuario usuario = Provider.of(context);

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
        title: Text('Alunos Cadastrados'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.of(context).pushNamed(
                RotasApp.FORMULARIO
              );
            }, 
        ),
        ],
      ),
      body: ListView.builder(//cria uma lista
        // itemCount quantos intes eu tenho q mostrar na list
        itemCount: usuario.listaElementos,
       itemBuilder: (ctx, i)=> BlocoUsuarios(usuario.indice(i)//Acessa o elemento
      ),
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
