import 'package:flutter/material.dart';
import 'package:mvvm/Utills/Routes/routes_name.dart';

import '../Utills/utils.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          // Navigator.pushNamed(context, RoutesName.home);
          // Utils.toastMsg("No Internet");
          setState(() {
            Utils.flushBar("No Internet",context);
          });
        }, child: const Text("Click")),
      ),
    );
  }
}
