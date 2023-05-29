import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/Screen/auth/login.dart';
import 'package:quize/Utils/CustomTextFormFiled.dart';
import 'package:quize/Utils/DefaultButton.dart';
import 'package:quize/conteroller/authgetx.dart';
import 'package:quize/model/User.dart';



class SocialRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<AuthGetx>(
        id:'SignUpScreen',
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    CustomTextFormFiled(textInputType: TextInputType.text,lable: "name", controller: controller.nameControler,hint: "Name",valid: (value) {
                      if(value!.isEmpty){
                        return value;
                      }
                      return null;
                    },),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormFiled(textInputType: TextInputType.emailAddress,lable: "email", controller: controller.emailControler,hint: "Email",valid: (value) {
                      if(value!.isEmpty){
                        return value;
                      }
                      return null;
                    },),
                    SizedBox(
                      height: 20,
                    ),

                    CustomTextFormFiled(textInputType: TextInputType.text,lable: "pass", controller: controller.passwordControler,hint: "Password",valid: (value) {
                      if(value!.isEmpty){
                        return value;
                      }
                      return null;
                    },),
                    SizedBox(
                      height: 20,
                    ),

                    SizedBox(height: 25,),
                    DefaultButton(text: "Register",width: double.infinity,onTap: () {
                      controller.SignUpFun(context);
                    },),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'dont have an account?',
                          style: TextStyle(
                            fontSize:16,
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => Login_screen(),), (route) => false);

                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 16,color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}