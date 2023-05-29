import 'package:flutter/material.dart';
import 'package:quize/conteroller/datagetx.dart';

showAlertDialog(BuildContext context,String id) {
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Delete question"),
    content: Text("Are you sure want  to delete  this question"),
    actions: [
      TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              minimumSize: Size(70, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text('cancel')),
      TextButton(
          onPressed: () {
            data.to.deleteQusetion(int.parse(id));
            Navigator.of(context).pop();
          },
          style: TextButton.styleFrom(
              backgroundColor: Colors.greenAccent,
              minimumSize: Size(70, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text('Delete')),
    ],
  );
  // viser dialogvinduet
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
