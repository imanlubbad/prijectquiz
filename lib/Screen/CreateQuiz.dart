import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/Screen/AddQuestion.dart';
import 'package:quize/Utils/ShowAlertDialog.dart';
import 'package:quize/conteroller/datagetx.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Quiz'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: GetBuilder<data>(
        id: 'AddQuestion',
        builder: (controller) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddQuestion(),));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Create Quiz',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )),
              SizedBox(height: 10,),
              Expanded(
                  child:controller.items.length!=0? ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Test Test TestTest Test TestTest?',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    InkWell(
                                        onTap: () => showAlertDialog(context,controller.items[index].id.toString()),
                                        child: Icon(Icons.delete)),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S == 'A'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].A),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S == 'B'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].B),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S == 'C'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].C),
                                  ),
                                ),

                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: controller.items[index].S ==  'D'? Colors.green:Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(controller.items[index].D),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: controller.items.length):Center(child: Text('The question bank is empty, fill it in'
                  ),))
            ],
          ),
        ),
      ),
    );
  }
}
