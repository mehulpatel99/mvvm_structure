import 'package:flutter/material.dart';
import 'package:mvvm/Resources/Components/round_btn.dart';
import 'package:mvvm/Utills/Routes/routes_name.dart';
import 'package:mvvm/View_Model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../Utills/utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  ValueNotifier<bool> _obSecurePassword = ValueNotifier<bool>(true);

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passController.dispose();

    emailFocus.dispose();
    passFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel =   Provider.of<AuthViewModel>(context);

    final height = MediaQuery.sizeOf(context).height*1;

    return Scaffold(
      body:SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            focusNode: emailFocus,
            decoration: const InputDecoration(
              hintText: "Email",
              labelText: "Email",
              prefixIcon: Icon(Icons.alternate_email)
            ),
            onFieldSubmitted: (value){
              Utils.fieldFocus(context, currentFocus: emailFocus,nextFocus: passFocus);
              // FocusScope.of(context).requestFocus(passFocus);
            },
          ),
        ValueListenableBuilder(
          valueListenable: _obSecurePassword,
          builder: (context, value, child) {
            return TextFormField(
              controller: passController,
              focusNode: passFocus,
              obscureText: _obSecurePassword.value,
              decoration:  InputDecoration(
                  hintText: "Password",
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.password),
              suffixIcon: InkWell(
                  onTap: (){
                    _obSecurePassword.value = !_obSecurePassword.value;
                  },
                  child:  Icon(
                      _obSecurePassword.value ? Icons.visibility_off : Icons.visibility))
              ),
            );
          },
        ),
          SizedBox(height: height * .085,),
          RoundBtn(title: "Login", onPress: (){
                 if(emailController.text.isEmpty){
                    Utils.flushBar("Please Enter Email", context);
                 }else if(passController.text.isEmpty){
                   Utils.flushBar("Please Enter password", context);
                 }else if(passController.text.length < 6){
                   Utils.flushBar("Please Enter 6 digit password", context);
                 }else{
                   Map data = {
                     "email": emailController.text.toString(),//"eve.holt@reqres.in",
                     "password": passController.text.toString(),//"cityslicka"
                   };
                      authViewModel.loginApi(context,data);
                      print("On Tap---Login");
                 }
          })
      ],
    ))
    );
  }
}
