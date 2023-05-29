import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/db/DBSQLITE.dart';
import 'package:quize/model/User.dart';

class AuthGetx extends GetxController{
  static AuthGetx get to => Get.find();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<User> data = [];
  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  //SignUp
  TextEditingController emailControler=TextEditingController();
  TextEditingController passwordControler=TextEditingController();
  TextEditingController phoneControler=TextEditingController();
  TextEditingController nameControler=TextEditingController();
  //Login
  TextEditingController emailControlerLogin =TextEditingController();
  TextEditingController passwordControlerLogin =TextEditingController();
  @override
  void onInit() {
    super.onInit();
    refreshUserList();
  }

  void refreshUserList() async {
    List<User> itemList = await _databaseHelper.getAllUsers();
    data = itemList;
    update(['SignUpScreen','LoginScreen']);
  }

  void addUser({required User newUser,required context}) async {
    await _databaseHelper.insertUser(newUser,context).then((value) {
      });
    refreshUserList();
  }

  void updateUser(User item) async {
    await _databaseHelper.updateUser(item);
    refreshUserList();
  }

  void deleteUser(int id) async {
    await _databaseHelper.deleteUser(id);
    refreshUserList();
  }
  void getUserByEmailPassword({required context,required String email,required String password}) async{
    await _databaseHelper.getUserByEmailAndPassword(email, password,context);
    update(['LoginScreen']);
  }
  void SignUpFun(BuildContext context) {
    if(formKey.currentState!.validate()){
      User newUser =User();
      newUser.email =  emailControler.text;
      newUser.name =  nameControler.text;
      newUser.password =  passwordControler.text;
      addUser(context: context,newUser:newUser);
      emailControler.text = '';nameControler.text = '';
      passwordControler.text = '';
      update(['SignUpScreen']);
    }
  }
  void SignInFun(BuildContext context) {
    if(formKey.currentState!.validate()){
      getUserByEmailPassword(context: context,email:  emailControlerLogin.text,password:  passwordControlerLogin.text);
      emailControlerLogin.text = '';
      passwordControlerLogin.text = '';
      Navigator.pushReplacementNamed(context, 'home');
      update(['LoginScreen']);
    }
  }
}