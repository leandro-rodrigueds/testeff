import 'package:flutter/material.dart';
import 'package:flutter_cadastro/dados/dados_usuarios.dart';
import 'package:flutter_cadastro/modelos/usuario.dart';

class MetodosUsuarios with ChangeNotifier {
  final Map<String, Usuario> _items = {...DADOS_USUARIOS};

  List<Usuario> get all {
    return [..._items.values];
  }

  //
  int get count {
    return _items.length;
  }

  Usuario byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //put +- a auteração do usuario
  void put(Usuario usuario) {
    if (usuario == null) {
      return;
    }

    if (usuario.nomeAluno != null &&
        usuario.nomeAluno.isNotEmpty &&
        _items.containsKey(usuario.nomeAluno)) {
      _items.update(
          usuario.nomeAluno,
          (_) =>
              Usuario(nomeAluno: usuario.nomeAluno, nomeMae: usuario.nomeMae));
    } else {
      //Adicionar
      _items.putIfAbsent(
          usuario.nomeAluno,
          () => Usuario(
                nomeAluno: usuario.nomeAluno,
                nomeMae: usuario.nomeMae,
              ));

      notifyListeners();
    }
  }

  void remove(Usuario usuario){
    if(usuario != null && usuario.nomeAluno != null){
      _items.remove(usuario.nomeAluno);
      notifyListeners();
    }
  }
}
