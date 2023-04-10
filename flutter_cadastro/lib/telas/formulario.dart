import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_cadastro/modelos/usuario.dart';
import 'package:flutter_cadastro/provider/metodos_usuario.dart';
import 'package:provider/provider.dart';

class Formulario extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _iformacaoUsuarios = {};

  TextEditingController _inputnomeAluno =TextEditingController();
  TextEditingController _inputnomeMae =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Usuarios'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValido = _form.currentState!.validate();

              if (isValido) {
                _form.currentState?.save();

                // Provider.of<MetodosUsuarios>(context, listen: false).put(Usuario(
                //   nomeAluno: _iformacaoUsuarios ['nomeAluno'], 
                //   nomeMae: _iformacaoUsuarios['nomeMae'])
                // );
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _inputnomeAluno,
                decoration: InputDecoration(labelText: 'Nome do aluno:'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Nome invalido';
                  }
                  if(value.trim().length < 10){
                    return 'Nome Invalido';
                  }
                  return null;
                },
                onSaved: (value) => _iformacaoUsuarios['nomeAluno'],
              ),
              TextFormField(
                controller: _inputnomeMae,
                decoration: InputDecoration(labelText: 'Nome da Mãe:'),
                onSaved: (value) => _iformacaoUsuarios['nomeMae'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
