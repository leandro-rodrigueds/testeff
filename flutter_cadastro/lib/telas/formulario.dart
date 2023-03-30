import 'package:flutter/material.dart';
import 'package:flutter_cadastro/modelos/usuario.dart';
import 'package:flutter_cadastro/provider/metodos_usuario.dart';
import 'package:provider/provider.dart';

class Formulario extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _informacoesUsuarios = {};

  void _dadosFormolario(Usuario usuario){
    if(usuario != null){
    _informacoesUsuarios['nomeAluno'] = usuario.nomeAluno;
    _informacoesUsuarios['nomeMae'] = usuario.nomeMae;
  }
    }
    

  @override
  Widget build(BuildContext context) {

    final usuario = ModalRoute.of(context)?.settings.arguments as Usuario;

    _dadosFormolario(usuario);

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

                Provider.of<MetodosUsuarios>(context, listen: false)
                    .put(Usuario(
                  nomeAluno: '',
                  nomeMae: '',
                  //  nomeAluno: _informacoesUsuarios['nomeAluno'],
                  //  nomeMae: _informacoesUsuarios['nomeMae'],
                ),
              );

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
                initialValue: _informacoesUsuarios['nomeAluno'],
                decoration: InputDecoration(labelText: 'Nome do aluno:'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nome invalido';
                  }
                  if (value.trim().length < 10) {
                    return 'Nome Invalido';
                  }
                  return null;
                },
                onSaved: (value) =>
                    _informacoesUsuarios['nomeAluno'] = value!, //!esta diferente
              ),
              TextFormField(
                initialValue: _informacoesUsuarios['nomeMae'],
                decoration: InputDecoration(labelText: 'Nome da Mãe:'),
                onSaved: (value) => _informacoesUsuarios['nomeMae'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
