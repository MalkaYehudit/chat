

import 'package:chat_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:chat_app/components/my_botton.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/theme_provider.dart';
import 'package:chat_app/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    final authService = AuthService();

    try{
      await authService.signInWithEmailPassword(
        emailController.text,
        passwordController.text
        
        );
        Navigator.pushReplacement(
          context,
           MaterialPageRoute(builder: (context)=>HomePage())
           );
    } catch (e) {
      String getErrorMessage = authService.getErrorMessage(e.toString(),);
      showDialog(
        context: context,
         builder: (context)=>AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: Text(getErrorMessage),
         ),
         );
    
    }
  }
  void navigatorToRegister(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterPage()),
    );

  }



  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'lib/images/message.png',
                  height: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Welacome back!',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(
                  height: 50,
                ),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 10,),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){},
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                MyButton(
                  onTap:login,
                  text:'Login',
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: navigatorToRegister,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
               