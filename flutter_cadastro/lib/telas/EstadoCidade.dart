import 'package:flutter/material.dart';

import '../rotas/rotas_app.dart';

class EstadoCidade extends StatefulWidget {
  @override
  _EstadoCidadeState createState() => _EstadoCidadeState();
}

class _EstadoCidadeState extends State<EstadoCidade> {
  String? estadoSelecionado;
  String? cidadeSelecionada;

  final List<String> estados = [
    'Minas Gerais',
    'São Paulo',
    'Rio de Janeiro',
    'Bahia',
    'Paraná',
    'Santa Catarina',
    'Rio Grande do Sul',
    'Ceará',
    'Pernambuco',
    'Goiás',
    'Amazonas',
    'Pará',
    'Maranhão',
    'Roraima',
    'Rondônia',
    'Acre',
    'Amapá',
    'Tocantins',
    'Distrito Federal',
    'escolha'
  ];

  Map<String, List<String>> cidadesPorEstado = {
    'Minas Gerais': ['Belo Horizonte'],
    'São Paulo': ['São Paulo'],
    'Rio de Janeiro': ['Rio de Janeiro'],
    'Bahia': ['Salvador'],
    'Paraná': ['Curitiba'],
    'Santa Catarina': ['Florianópolis'],
    'Rio Grande do Sul': ['Porto Alegre'],
    'Ceará': ['Fortaleza'],
    'Pernambuco': ['Recife'],
    'Goiás': ['Goiânia'],
    'Amazonas': ['Manaus'],
    'Pará': ['Belém'],
    'Maranhão': ['São Luís'],
    'Roraima': ['Boa Vista'],
    'Rondônia': ['Porto Velho'],
    'Acre': ['Rio Branco'],
    'Amapá': ['Macapá'],
    'Tocantins': ['Palmas'],
    'Distrito Federal': ['Brasília'],
  };

  List<String> cidades = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('ESTADO E CIDADE'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 0, 0),
                      
                    ),
                    child: Text('Escolher estado'),
                    onPressed: () {
                      // mostrar diálogo para escolher estado
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Escolha o ESTADO'),
                            content: DropdownButton<String>(
                              value: estadoSelecionado,
                              onChanged: (String? value) {
                                setState(() {
                                  estadoSelecionado = value;
                                  cidades = cidadesPorEstado[value!]!;
                                  cidadeSelecionada = null;
                                });
                              },
                              items: estados.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 134, 0, 0),
                    ),
                    child: Text('Escolher cidade'),
                    onPressed: () {
                      // mostra diálogo para escolher cidade
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Escolha a CIDADE'),
                            content: DropdownButton<String>(
                              value: cidadeSelecionada,
                              onChanged: (String? value) {
                                setState(() {
                                  cidadeSelecionada = value;
                                });
                              },
                              items: cidades.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Column(
                  children: [
                   IconButton(
                    color: Colors.grey,
                 icon: Icon(Icons.arrow_circle_right_outlined),
                 onPressed: () {
                  if (estadoSelecionado != null && cidadeSelecionada != null) {
                  Navigator.of(context).pushNamed(RotasApp.ESTCID);
                  } else {
                    showDialog(
                    context: context,
                     builder: (BuildContext context) {
                      return AlertDialog(
                      title: Text('Aviso'),
                      content: Text('Insira cidade e estado'),
                       actions: <Widget>[
                        TextButton(
                        child: Text('OK'),
                         onPressed: () {
                          Navigator.of(context).pop();
                            },
                           ),
                          ],
                         );
                        },
                       );
                      }
                     },
                    ),
                    Text('Estado: $estadoSelecionado'),
                    Text('Cidade: $cidadeSelecionada'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
