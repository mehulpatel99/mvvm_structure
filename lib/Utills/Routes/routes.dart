import 'package:flutter/material.dart';
import 'package:mvvm/Utills/Routes/routes_name.dart';
import 'package:mvvm/View/home_screen.dart';
import 'package:mvvm/View/login_screen.dart';
import 'package:mvvm/View/signUp.dart';

class Routes{
  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> const LoginScreen());

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> const HomeScreen());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> const SignupView());

      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No Route"),
            ),
          );
        });
    }
  }
}

