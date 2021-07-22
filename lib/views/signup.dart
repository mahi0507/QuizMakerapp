import 'package:flutter/material.dart';
import 'package:quizapp/services/auth.dart';
import 'package:quizapp/views/hompage.dart';

import 'package:quizapp/widgets/widgets.dart';
import '../views/signin.dart';

class SignUp extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  AuthService authService=new AuthService();
   bool _isLoading=false ;
  signUp()async{
    if(_formKey.currentState!.validate()){
      setState(() {
        _isLoading=true;
      });
      authService.signUpWithEmailAndPassword(email, password).then((val){
      if(val!=null){
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder:(context)=>HomePage()));
      }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: appBar(context),
      ),
      body: _isLoading?Container(
        child: CircularProgressIndicator(),
      ):Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/wallpaper.jpeg'), fit: BoxFit.fill)),
          child: Column(
            children: [
              // AspectRatio(
              //     aspectRatio: 5 / 3,
              //     child: Center(child: Image.asset('assets/logo.jpeg'))),
              Spacer(),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return null;
                  } else {
                    return "Enter emailid";
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Email",
                  labelText: 'EmailID',
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return null;
                  } else {
                    return "Enter Name";
                  }
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Name",
                  labelText: 'Name',
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return null;
                  } else {
                    return "Enter Password";
                  }
                },
                obscureText: true,
                decoration: InputDecoration(

                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: "Create password",
                  labelText: 'Password',

                ),
                onChanged: (val) {
                  password= val;
                },
              ),
              SizedBox(height: 15),
              ElevatedButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(100, 50),
                    padding: EdgeInsets.symmetric(horizontal: 150.0),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                  ),
                  onPressed: () {
                    signUp();
                  },
                  child: Text(
                    "SignUp",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?",style: TextStyle(fontWeight:FontWeight.w800),),
                  TextButton(

                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => SignIn()));
                      },
                      child: Text("SignIn"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
