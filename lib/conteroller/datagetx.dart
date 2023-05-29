import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/db/DBSQLITE.dart';
import 'package:quize/model/QusetionModel.dart';

class data extends GetxController{
  static data get to => Get.find();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<QusetionModel> items = [];
    TextEditingController textEditingController1 = TextEditingController();
    TextEditingController textEditingController2 = TextEditingController();
    TextEditingController textEditingController3 = TextEditingController();
    TextEditingController textEditingController4 = TextEditingController();
    TextEditingController textEditingController5 = TextEditingController();
  List<String> list = <String>['A', 'B', 'C', 'D'];
  String dropdownValue = 'A';

  @override
  void onInit() {
    super.onInit();
    refreshQusetionList();
  }

  void refreshQusetionList() async {
    List<QusetionModel> itemList = await _databaseHelper.getQusetion();
        items = itemList;
       update(['AddQuestion']);
   }

  void addQusetion({required QusetionModel newItem}) async {
     await _databaseHelper.insertQusetion(newItem).then((value) {
       log('$newItem');
     });
     refreshQusetionList();
  }

  void updateQusetion(QusetionModel item) async {
     await _databaseHelper.updateQusetion(item);
    refreshQusetionList();
  }

  void deleteQusetion(int id) async {
    await _databaseHelper.deleteQusetion(id);
    refreshQusetionList();
  }
  void setSelectionAnswer(String s){
    dropdownValue = s;
    update(['AddQuestion']);
  }
  void ValedationInput(BuildContext context) {
    if (textEditingController1.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Question');
    }else if (textEditingController2.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer A');
    }else if (textEditingController3.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer B');
    }else if (textEditingController3.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer C');
    }else if (textEditingController5.text.isEmpty) {
      ShowSnackBar(
          context: context, Message: 'Required Answer d');
    }else  {
      ShowSnackBar(
          context: context, Message: 'Required All Answer A,B,C,D');
    }
  }
  void AddNewItem(data controller, QusetionModel object) {
    controller.addQusetion(newItem: object);
    textEditingController1.text = '';
    textEditingController2.text = '';
    textEditingController3.text = '';
    textEditingController4.text = '';
    textEditingController5.text = '';
  }
  QusetionModel newQusetionModel() {
    QusetionModel object = QusetionModel();
    object.name = textEditingController1.text;
    object.A = textEditingController2.text;
    object.B = textEditingController3.text;
    object.C = textEditingController4.text;
    object.D = textEditingController5.text;
    object.S = dropdownValue;
    return object;
  }
  bool CheckData() {
    return textEditingController1.text.isNotEmpty &&
        textEditingController2.text.isNotEmpty &&
        textEditingController3.text.isNotEmpty &&
        textEditingController4.text.isNotEmpty &&
        textEditingController5.text.isNotEmpty;
  }
  void ShowSnackBar({required BuildContext context, required String Message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.transparent,
        elevation: 0,
        width: 350,
        content: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
          child: Center(
            child: Text(
              Message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}