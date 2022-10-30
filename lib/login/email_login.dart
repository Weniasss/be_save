import 'package:be_save/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  _logIn() async {

    // try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);

      Navigator.of(context).push(MaterialPageRoute(builder: (contex) => Home()));

    // }  catch(e) {
    //
    //   var message = '';
    //
    //   switch(e) {
    //     case "invalid-email":
    //       message = "email invalid";
    //       break;
    //     case 'user-disabled':
    //       message = "disable user";
    //       break;
    //     case 'user-not-found':
    //       message = "not found user";
    //       break;
    //     case 'wrong-password':
    //       message = "invalid password";
    //       break;
    //   }

      // showDialog(context: context, builder: (context) {
      //   return AlertDialog(
      //     title: Text('Log In failled'),
      //     content: Text(message),
      //     actions: [
      //       TextButton(onPressed: (){
      //         Navigator.of(context).pop();
      //       }, child: Text('Ok'))
      //     ],
      //   );
      // });



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Log in', style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),),

            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
            ),
            
            ElevatedButton(onPressed: () {
              _logIn();
            },
                child: Text('Log In'))
          ],
        ),
      ),

    );
  }
}
