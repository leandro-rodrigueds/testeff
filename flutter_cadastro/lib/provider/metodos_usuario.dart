import 'package:flutter/widgets.dart';
import '../dados/dados_usuarios.dart';
import '../modelos/usuario.dart';

class TrataUsuario with ChangeNotifier{
  final Map <String,Usuario> _items = {...DADOS_USUARIOS};

  List<Usuario> get all{
    //cria um clone da lista para os usuarios não possa modificar os arquivos diretamente, só adicionando quando o metodo adicionar determinado item for chamado 
    return [..._items.values];
  }

  int get listaElementos{
    return _items.length;
  }

  Usuario indice(int i){
    return _items.values.elementAt(i);
  }

  void adicionaAluno(Usuario usuario){
    if(usuario == null){
      return;
    }
    //putIfAbsent insere se não estiver dentro
    if (usuario.nomeAluno != null &&
        usuario.nomeAluno.isNotEmpty &&
        _items.containsKey(usuario.nomeAluno)) {
      _items.update(
          usuario.nomeAluno,
          (_) =>
              Usuario(nomeAluno: usuario.nomeAluno, nomeMae: usuario.nomeMae));
       notifyListeners();
    } else {
      //Adicionar
      _items.putIfAbsent(
          usuario.nomeAluno,
          () => Usuario(
                nomeAluno: usuario.nomeAluno,
                nomeMae: usuario.nomeMae,
              ));
      //Adiciona na interface grafica
      notifyListeners();
    }
  }

  void editaAluno(Usuario usuario){
      _items.update(usuario.nomeAluno, (_) => Usuario(
        nomeAluno: usuario.nomeAluno, 
        nomeMae: usuario.nomeMae));
        notifyListeners();
  }

  void removeAluno(Usuario usuario){
     if(usuario != null && usuario.nomeAluno != null){
      _items.remove(usuario.nomeAluno);
      notifyListeners();
    }
  }

}