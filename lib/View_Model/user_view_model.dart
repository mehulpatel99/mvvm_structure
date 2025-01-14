import 'package:flutter/material.dart';
import 'package:mvvm/Model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sessionManager = await SharedPreferences.getInstance();

    sessionManager.setString("token", user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser()async{
    final SharedPreferences sessionManager = await SharedPreferences.getInstance();

   String? token = await sessionManager.getString("token");
    return UserModel(
      token: token
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sessionManager = await SharedPreferences.getInstance();
   return sessionManager.clear();
  }

}
