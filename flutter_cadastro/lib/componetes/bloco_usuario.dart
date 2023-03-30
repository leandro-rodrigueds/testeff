import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_cadastro/modelos/usuario.dart';
import 'package:flutter_cadastro/provider/metodos_usuario.dart';
import 'package:flutter_cadastro/telas/cadastroUsuarios.dart';
import 'package:provider/provider.dart';

import '../rotas/rotas_app.dart';

class BlocoUsuario extends StatelessWidget {
  final Usuario usuario;
  const BlocoUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario.nomeAluno),
      subtitle: Text(usuario.nomeMae),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  RotasApp.FORMULARIO
                  //arguments: usuario,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.redAccent,
              onPressed: () {
                Provider.of <MetodosUsuarios> (context, listen: false).remove(usuario);
              },
            ),
          ],
        ),
      ),
    );
  }
}
