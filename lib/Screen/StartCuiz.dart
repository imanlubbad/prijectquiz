import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quize/conteroller/datagetx.dart';
import 'package:quize/Screen/result.dart';

class SatrtQuiz extends StatefulWidget {
  const SatrtQuiz({Key? key}) : super(key: key);

  @override
  State<SatrtQuiz> createState() => _SatrtQuizState();
}

class _SatrtQuizState extends State<SatrtQuiz> {
  int i = 1;
  int sum = 0;
  int page = 0;
  String ans = '';
 late PageController pageController;
 @override
  void initState() {
   pageController = PageController();
   // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
   pageController.dispose();
   // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: data.to.items.isNotEmpty
          ? Column(
              children: [
                SizedBox(height: 50,),
                Text(
                  'Question $i / ${data.to.items.length}',
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Container(
                  width: double.infinity,
                  height: 360,
                  child: PageView(
                    onPageChanged: (value) {
                      setState(() {
                        page = value;
                        i = value+1;
                      });
                    },
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ...data.to.items.map((e) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 370,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.greenAccent
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(e.name),
                                    ),
                                  ),
                                  Divider(),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                     Q(Answer: e.S, context: context,check: 'a');
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.greenAccent
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.A),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                      Q(Answer: e.S,context:  context,check: 'b');
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.greenAccent
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.B),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                      Q(Answer: e.S,context:  context,check: 'c');
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.greenAccent
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.C),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  InkWell(
                                    onTap: (){
                                      Q(Answer: e.S, context: context,check: 'd');
                                    },
                                    child: Container(
                                      width: 370,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          border: Border.all(
                                              color: Colors.greenAccent
                                          ),
                                          color: Colors.white
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(e.D),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        );
                      })
                    ],
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sorry!',
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'You must  add at least 5  question to Start!',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Image.asset('images/3.png'),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        minimumSize: Size(160, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: Text('Back to Home'))
              ],
            ),
    );
  }

  void Q({required String Answer ,required BuildContext context,required String check}) {
    if(Answer.toLowerCase()==check){
      setState(() {
        sum++;
      });
      if(page+1 == data.to.items.length){
        log('${page-1 == data.to.items.length}');
        Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
      }else{
        pageController.jumpToPage(page+1);
      }
    }else{
      if(page+1 == data.to.items.length){
        log('${page-1 == data.to.items.length}');
        Navigator.push(context, MaterialPageRoute(builder: (context) => result(i: sum),));
      }else{
        pageController.jumpToPage(page+1);
      }
    }
  }
}
