import 'package:flutter/material.dart';
import 'package:quize/Screen/CreateQuiz.dart';
import 'package:quize/Screen/StartCuiz.dart';
import 'package:quize/db/SharedPreferencesApp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.greenAccent),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Center(
                    child: Icon(Icons.person_2,size: 24,)
                  ),
                ),
                accountName: Text(SharedPreferencesApp().nameUser),
                accountEmail: Text(SharedPreferencesApp().emailUser)),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateQuiz(),
                    ));
              },
              leading: Icon(Icons.edit),
              title: Text('Create Quiz'),
            ),
            ListTile(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SatrtQuiz(),
                  )),
              leading: Icon(Icons.quiz_sharp),
              title: Text('Start Quiz'),
            ),
            Divider(),
            ListTile(
              onTap: ()async{
                Navigator.pushNamed(context,'update');
              },
              leading: Icon(Icons.account_box_outlined,size: 24,),
              title: Text('EditeProfile'),
            ),
            Divider(),
            ListTile(
              onTap: ()async{
                await SharedPreferencesApp().clearData();
                Navigator.pushReplacementNamed(context,'login');
              },
              leading: Icon(Icons.login),
              title: Text('Exit'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Image.asset('images/4.png', width: 300, height: 300),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SatrtQuiz(),
                    ));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  minimumSize: Size(160, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: Text('Let\'s Start !'))
        ],
      ),
    );
  }
}
