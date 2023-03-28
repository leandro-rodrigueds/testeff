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

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Alunos'),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                RotasApp.FORMULARIO
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: usuarios.count,
        itemBuilder: (ctx, i) => BlocoUsuario(usuarios.byIndex(i)),
      ),
    );
  }
}
