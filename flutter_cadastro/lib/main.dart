import 'package:flutter/material.dart';
import 'package:flutter_cadastro/provider/metodos_usuario.dart';
import 'package:flutter_cadastro/rotas/rotas_app.dart';
import 'package:flutter_cadastro/telas/alunos_cadastrados.dart';
import 'package:flutter_cadastro/telas/configuracoes.dart';
import 'package:flutter_cadastro/telas/formulario.dart';
import 'package:flutter_cadastro/telas/EstadoCidade.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Esse provider controla a parte de usuario e cria uma nova instacia na classe
      create: (context) => new TrataUsuario(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          RotasApp.HOME: (_) => EstadoCidade(),
          RotasApp.ALUNOS: (_) => ListaUsuarios(),
          RotasApp.FORMULARIO: (_) => Formulario(),
          RotasApp.CONFIG: (_) => Configuracoes()
        },
      ),
    );
  }
  
}
