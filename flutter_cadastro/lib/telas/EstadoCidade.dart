import 'package:flutter/material.dart';

class EstadoCidade extends StatelessWidget {
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

  final List<String> cidades = [
    'Belo Horizonte',
    'São Paulo',
    'Rio de Janeiro',
    'Salvador',
    'Curitiba',
    'Florianópolis',
    'Porto Alegre',
    'Fortaleza',
    'Recife',
    'Goiânia',
    'Manaus',
    'Belém',
    'São Luís',
    'Boa Vista',
    'Porto Velho',
    'Rio Branco',
    'Macapá',
    'Palmas',
    'Brasília',
    'escolha'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('ESTADO E CIDADE'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/mapa.png',
              width: double.infinity,
              height: double.infinity,
            ),
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
                              value: 'escolha',
                              onChanged: (String? value) {},
                              items: estados.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
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
                      // mostrar diálogo para escolher cidade
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Escolha a CIDADE'),
                            content: DropdownButton<String>(
                              value: 'escolha',
                              onChanged: (String? value) {},
                              items: cidades.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          );
                        },
                      );
                    },
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
