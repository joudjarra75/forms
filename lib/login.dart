import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool isVisable = true;
  var numOfChar = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Color(0xCD577c8e),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key:_formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  Lottie.network("https://lottie.host/01addab6-9a83-4d04-81e2-81d9bb3a8d91/Z15LyIVxXd.json"),

                  // Image.network("https://ouch-cdn2.icons8.com/FFYTXMueeOdXVeurM5uZqTwr8aWA2V1N6Tir1HIay8c/rs:fit:368:276/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjYv/MjhhZmFlN2ItMjEw/NS00ZTU5LWFlYjYt/NmJjMDAzYjI0ZDUw/LnN2Zw.png",),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(

                    decoration: decoration("username", "username or email"),
                    validator:(userName){
                      if(userName!.isEmpty || userName.length == 0){
                        return "Required";
                      }
                      else if(!(emailValidation(userName))){
                        return "This email not valid";
                      }

                      return null; //no error
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    maxLength: 10,
                    obscureText: isVisable,
                    decoration: InputDecoration(
                      counter: Text("$numOfChar"),
                        suffixIcon:isVisable ? InkWell(child: Icon(Icons.visibility),
                          onTap: (){
                            setState(() {
                              isVisable = !isVisable;
                            });                          },) :
                        InkWell(child: Icon(Icons.visibility_off),
                          onTap: (){
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },)
                        ,
                        label: Text("password"),
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
                        hintText: "*********"
                    ),
                    validator: (password){
                      if(password!.isEmpty){
                        return "enter password";
                      }
                      else if(!(paswwordFun(password))){
                        return "Not valid";

                      }

                      return null;
                    },
                    onChanged: (value){
setState(() {
  numOfChar = value.length;

});                    },

                  ),

                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: decoration("password", "enter password again"),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      print("no error");
                    }
                    else{
                      print("Error");
                    }

                  }, child: Text("Sign Up"))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  bool emailValidation(String email){
    String pattern = r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';
    return RegExp(pattern).hasMatch(email);



  }
  bool paswwordFun(String pass){
    String REG=r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
    return RegExp(REG).hasMatch(pass);

  }
}

// create key - > GlobalKey (check)
// connect key with from (check)
// valdition (check value(data))
// class LoginScreen extends StatelessWidget{
//   final _formKey = GlobalKey<FormState>();
//   bool isVisable = true;
//   @override
//   Widget build(BuildContext context) {
   // return Scaffold(
   //   appBar: AppBar(
   //     title: Text("Login Page",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
   //     centerTitle: true,
   //     backgroundColor: Color(0xCD577c8e),
   //   ),
   //   body: SingleChildScrollView(
   //     child: Padding(
   //       padding: const EdgeInsets.all(20),
   //       child: Form(
   //         key:_formKey ,
   //         child: Column(
   //           crossAxisAlignment: CrossAxisAlignment.center,
   //           children: [
   //             SizedBox(
   //               height: 30,
   //             ),
   //
   //             Lottie.network("https://lottie.host/01addab6-9a83-4d04-81e2-81d9bb3a8d91/Z15LyIVxXd.json"),
   //
   //             // Image.network("https://ouch-cdn2.icons8.com/FFYTXMueeOdXVeurM5uZqTwr8aWA2V1N6Tir1HIay8c/rs:fit:368:276/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjYv/MjhhZmFlN2ItMjEw/NS00ZTU5LWFlYjYt/NmJjMDAzYjI0ZDUw/LnN2Zw.png",),
   //             SizedBox(
   //               height: 20,
   //             ),
   //             TextFormField(
   //               decoration: decoration("username", "username or email"),
   //               validator:(userName){
   //                 if(userName!.isEmpty || userName.length == 0){
   //                   return "Required";
   //                 }
   //                 else if(!(emailValidation(userName))){
   //                   return "This email not valid";
   //                 }
   //
   //                  return null; //no error
   //               },
   //             ),
   //             SizedBox(
   //               height: 20,
   //             ),
   //             TextFormField(
   //               obscureText: isVisable,
   //               decoration: InputDecoration(
   //                 suffixIcon:isVisable ? InkWell(child: Icon(Icons.visibility),
   //                 onTap: (){
   //                   isVisable = !isVisable;
   //                 },) :  InkWell(child: Icon(Icons.visibility_off),
   //                   onTap: (){
   //                     isVisable = !isVisable;
   //                   },)
   //                   ,
   //                   label: Text("password"),
   //                   enabledBorder: OutlineInputBorder(
   //                       borderRadius: BorderRadius.circular(40),
   //                       borderSide: BorderSide(
   //                           color: Color(0xCDc4dbe3),
   //                           width: 5
   //                       )
   //                   ),
   //                   focusedBorder: OutlineInputBorder(
   //                       borderSide: BorderSide(
   //                           color: Color(0xCD577c8e),
   //                           width: 5
   //                       ),
   //                       borderRadius: BorderRadius.circular(40)
   //                   ),
   //                   hintText: "*********"
   //               ),
   //               validator: (password){
   //                 if(password!.isEmpty){
   //                   return "enter password";
   //                 }
   //                 else if(!(paswwordFun(password))){
   //                   return "Not valid";
   //                 }
   //
   //                 return null;
   //               },
   //
   //             ),
   //
   //             SizedBox(
   //               height: 20,
   //             ),
   //             TextFormField(
   //               decoration: decoration("password", "enter password again"),
   //             ),
   //             SizedBox(
   //               height: 20,
   //             ),
   //
   //             ElevatedButton(onPressed: (){
   //                if(_formKey.currentState!.validate()){
   //                  print("no error");
   //                }
   //                else{
   //                  print("Error");
   //                }
   //
   //             }, child: Text("Sign Up"))
   //
   //           ],
   //         ),
   //       ),
   //     ),
   //   ),
   // );
  // }
  // bool emailValidation(String email){
  //   String pattern = r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';
  //   return RegExp(pattern).hasMatch(email);
  //
  //
  //
  // }
  // bool paswwordFun(String pass){
  //   String REG=r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$";
  //   return RegExp(REG).hasMatch(pass);
  //
  // }


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
