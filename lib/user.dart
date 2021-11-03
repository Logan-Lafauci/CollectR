import 'package:collectr/collectible.dart';
import 'collectible.dart';

class User {
  String _username;
  String _password;
  var collectibleList = <Collectible>[];

  User(this._username, this._password);

  String get getUsername =>  _username;

  String get getPassword => _password;

  List<Collectible> get getListOfCollectibles => collectibleList;

  set setUsername(String _username) {
    this._username = _username;
  }

  set setPassword(String _password) {
    this._password = _password;
  }

  void addItem(Collectible newPost) {
    collectibleList.add(newPost);
  }
}
