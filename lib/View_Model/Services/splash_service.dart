import 'package:flutter/cupertino.dart';
import 'package:mvvm/Model/user_model.dart';
import 'package:mvvm/Utills/Routes/routes_name.dart';
import 'package:mvvm/View_Model/user_view_model.dart';

class SplashService{
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context ){
    getUserData().then((value) async {
      if(value.token == null || value.token == ""){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      }else{
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    });
  }
}