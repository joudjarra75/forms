import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Login Page",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
       centerTitle: true,
       backgroundColor: Color(0xCD577c8e),
     ),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(20),
         child: Form(
           child: Column(
             children: [
               SizedBox(
                 height: 30,
               ),
               Image.network("https://cdn-icons-png.flaticon.com/512/6681/6681204.png",
               width: 100,),
               SizedBox(
                 height: 20,
               ),
               TextFormField(
                 decoration: decoration("username", "username or email")
               ),
               SizedBox(
                 height: 20,
               ),
               TextFormField(
                 decoration: decoration("password","enter your password"),
               ),
               SizedBox(
                 height: 20,
               ),
               TextFormField(
                 decoration: decoration("password", "enter password again"),
               )
       
             ],
           ),
         ),
       ),
     ),
   );
  }
}

InputDecoration decoration (String lbl,String hint){
  return InputDecoration(
    label: Text(lbl),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: BorderSide(
        color: Color(0xCDc4dbe3),
        width: 5
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xCD577c8e),
        width: 5
      ),
      borderRadius: BorderRadius.circular(40)
    ),
    hintText: hint
  );
}
