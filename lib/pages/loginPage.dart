import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
    final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 80),
        child: Form(
           key : formKey , 
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              
          )
             
        ),
      ),
    );
  }
}