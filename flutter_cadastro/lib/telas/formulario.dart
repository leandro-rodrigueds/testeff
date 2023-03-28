import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Formulario extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  //final Map <String, String>

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
                onSaved: (value) {
                  print(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome da Mãe:'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
