import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import '../modelos/usuario.dart';
import '../provider/metodos_usuario.dart';

class Formulario extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map <String, String> _dadosForm = {};

  void _carregaDadosFormulario(Usuario usuario){
    if(usuario != null){
      _dadosForm['nomeAluno'] = usuario.nomeAluno;
      _dadosForm['nomeMae'] = usuario.nomeMae;
    }

  }

  @override
  Widget build(BuildContext context) {
    //Pega dados passado via roda 
    //problema ao adicionar novo usuario por ele estar nulo 
    // final usuario = ModalRoute.of(context)?.settings.arguments as Usuario;
    
    // _carregaDadosFormulario(usuario);
    //print(usuario.nomeAluno);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastra Aluno'),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: (){
              final isValido = _form.currentState!.validate();

              if(isValido){
                _form.currentState?.save();
                Provider.of <TrataUsuario>(context, listen: false).adicionaAluno(Usuario(
                  nomeAluno: _dadosForm['nomeAluno']!, 
                  nomeMae: _dadosForm['nomeMae']!,));
                 // nomeAluno: '',
                 // nomeMae:'',
               // ));

                Navigator.of(context).pop();
              }

              
            })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          //Associa _form ao formulario
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _dadosForm['nomeAluno'],
                decoration: InputDecoration(labelText: 'Nome do Aluno'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Informe o nome do aluno'; 
                  }
                  if(value.trim().length < 7){
                    return 'Informe o nome do aluno completo'; 
                  }
                  return null;
                },
                onSaved: (value) =>_dadosForm['nomeUsuario'] = value!,
              
              ),
              TextFormField(
                initialValue: _dadosForm['nomeMae'],
                decoration: InputDecoration(labelText: 'Nome da Mae'),
                validator: (value) {
                  if(value == null || value.isEmpty){
                    return 'Informe o nome da mãe do aluno'; 
                  }
                  if(value.trim().length < 7){
                    return 'Informe o nome completo da mãe do aluno completo'; 
                  }
                  return null;
                },
                onSaved: (value) =>_dadosForm['nomeMae'] = value!,
              )
            ],
            )
          ),
        ),
    );
  }
}