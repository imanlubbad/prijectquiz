import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/Utils/CustomTextFormFiled.dart';
import 'package:quize/Utils/DefaultButton.dart';
import 'package:quize/conteroller/authgetx.dart';
import 'package:quize/db/SharedPreferencesApp.dart';
import 'package:quize/model/User.dart';

class ProfileUpdatePage extends StatefulWidget {
  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  var name = TextEditingController(text: SharedPreferencesApp().nameUser);
  var email = TextEditingController(text: SharedPreferencesApp().emailUser);
  var password = TextEditingController(text: SharedPreferencesApp().passUser);

  void _updateProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Profile updated successfully.'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: GetBuilder<AuthGetx>(
        builder: (controller) => Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: name,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text("Name"),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: password,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Password",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text("Password"),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Email",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text("Email"),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              DefaultButton(
                text: "Update",
                width: double.infinity,
                onTap: () {
                  User item = User();
                  item.email = email.text;
                  item.id = int.parse(SharedPreferencesApp().idUser);
                  item.name = name.text;
                  item.password = password.text;
                  controller.updateUser(item);
                  _updateProfile();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
