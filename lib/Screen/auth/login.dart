import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quize/Screen/auth/register.dart';
import 'package:quize/Utils/CustomTextFormFiled.dart';
import 'package:quize/Utils/DefaultButton.dart';
import 'package:quize/conteroller/authgetx.dart';

class Login_screen extends   StatefulWidget {
  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: GetBuilder<AuthGetx>(
        id: 'LoginScreen',
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(23.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const  Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight:FontWeight.bold ,
                      ),
                    ),
                    const  SizedBox(
                      height: 38,
                    ),
                    CustomTextFormFiled(textInputType: TextInputType.emailAddress,lable: "email", controller: controller.emailControlerLogin,hint: "Email",valid: (value) {
                      if(value!.isEmpty){
                        return value;
                      }
                      return null;
                    },),
                    const SizedBox(
                      height: 20,
                    ),

                    CustomTextFormFiled(textInputType: TextInputType.text,lable: "pass", controller: controller.passwordControlerLogin,hint: "password",valid: (value) {
                      if(value!.isEmpty){
                        return value;
                      }
                      return null;
                    },),
                    const SizedBox(
                      height: 15,
                    ),
                    DefaultButton(text: "Login",width: double.infinity,onTap: () {
                      controller.SignInFun(context);
                    },),
                    const SizedBox(
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
                             Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => SocialRegister(),), (route) => false);
                          },
                          child: const Text(
                            'Register',
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