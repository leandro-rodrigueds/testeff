import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../modelos/usuario.dart';
import '../provider/metodos_usuario.dart';
import '../rotas/rotas_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class BlocoUsuarios extends StatelessWidget {

  final Usuario usuario;

  //construtor
  const BlocoUsuarios(this.usuario);

  @override
  Widget build(BuildContext context) {
    
    return ListTile( //bloco com as posições pré definidas
      title: Text(usuario.nomeAluno),
      subtitle: Text(usuario.nomeMae),
      
      trailing: Container(//para deixar os botoes com espaço fixo
        width: 100,
        child: Row(
        children: <Widget>[
          IconButton( 
            icon: Icon(Icons.edit), 
            color: Colors.orange,
            onPressed: (){
              Navigator.of(context).pushNamed(
                RotasApp.FORMULARIO,
                arguments: usuario
              );
            },
          ),
          IconButton( 
            icon: Icon(Icons.delete), 
            color: Colors.red,
            onPressed: (){
              showDialog(
                context: context, 
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir Aluno'),
                  content: Text('Tem certeza ?'),
                  actions: <Widget>[
                    FloatingActionButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      },
                      child: Text('Não'),
                      ),
                      FloatingActionButton(
                      onPressed: (){
                        Provider.of <TrataUsuario>(context, listen: false).removeAluno(usuario);
                      },
                      child: Text('Sim'),
                      ),
                  ],
                )
              );
            }
          ),
        ],
        ),
      ),
    );
  }
}