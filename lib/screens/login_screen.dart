import 'package:flutter/material.dart';
import 'package:shoppify_app/common/rounded_button.dart';
import 'package:shoppify_app/screens/register_screen.dart';
import '../components/Clippath/lower_clip_path.dart';
import '../components/Clippath/upper_clip_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecure = true;
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
                      "Log-In",
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
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintText: "Enter You Email",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: isObsecure,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        isObsecure = !isObsecure;
                        setState(() {});
                      },
                      icon: Icon(
                          isObsecure ? Icons.visibility_off : Icons.visibility,
                          color: isObsecure ? Colors.grey : Colors.green),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              //Button
              SizedBox(height: 30,),
              RoundedButton(btnLabel: "Log-in"),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Passwaord!",
                    style: TextStyle(color: Colors.black),
                  )),
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
                  Center(child: Text("I have'nt an account.")),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterScreen()));
                      },
                      child: Text(
                        "Create an Account",
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
