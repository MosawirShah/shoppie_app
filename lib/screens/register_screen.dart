// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../common/rounded_button.dart';
import '../components/Clippath/lower_clip_path.dart';
import '../components/Clippath/upper_clip_path.dart';
import '../repo/network.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObsecure = true;
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipPath(
            clipper: UpperClipPath(),
            child: Container(
              height: height * 0.250,
              width: width * 1,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.only(left: 22.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign-up",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ),
          ),

          //   SizedBox(height: 50,),
          Form(
              key: _fromKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _nameController,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        hintText: "Enter Your name",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enrter your name';
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter you email";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: isObsecure,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            isObsecure = !isObsecure;
                            setState(() {});
                          },
                          icon: Icon(
                              isObsecure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: isObsecure ? Colors.grey : Colors.green),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          setState(() {

                          });
                          return "Please enter your password";
                        }
                      },
                    ),
                  ),
                  //Button
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                      btnLabel: "Sign-up",
                      onPress: (){
                         Network network = Network();
                         try{
                           if(_fromKey.currentState!.validate()){
                             UserCredential user = network.registerUser(_emailController.text.trim(),
                                 _passwordController.text.trim());

                             if(user!=null){
                               print("user Registered successfully");
                             }else{
                               print("Unsuccessful");
                             }
                           }
                         }catch(e){
                           print(e.toString());
                         }

                       }

                  ),
                ],
              )),

          ClipPath(
            clipper: LowerClipPath(),
            child: Container(
              height: 110,
              width: double.infinity,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Network network = Network();
                        if(_fromKey.currentState!.validate()){
                          network.registerUser(_emailController.text.trim(),
                              _passwordController.text.trim());
                        }
                      },
                      child: Text(
                        "Back to login",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
