import 'package:quize/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApp{
  SharedPreferencesApp._();
  static SharedPreferencesApp inist = SharedPreferencesApp._();
  factory SharedPreferencesApp(){
    return inist;
  }
  late SharedPreferences sharedPreferences;
  Future<void> SharedPreferencesAppInit()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<void> SaveDataUser(User object)async{
    await sharedPreferences.setBool('isLogged', true);
    await sharedPreferences.setString('idUser', object.id.toString());
    await sharedPreferences.setString('nameUser', object.name);
    await sharedPreferences.setString('emailUser', object.email);
    await sharedPreferences.setString('passUser', object.password);
  }
  Future<void> clearData()async{
    await sharedPreferences.clear();
  }
  String get idUser  =>  sharedPreferences.getString('idUser') ?? '';
  String get nameUser  =>  sharedPreferences.getString('nameUser') ?? '';
  String get emailUser  =>  sharedPreferences.getString('emailUser') ?? '';
  String get passUser  =>  sharedPreferences.getString('passUser') ?? '';
  bool get isLogged  =>  sharedPreferences.getBool('isLogged') ?? false;
}