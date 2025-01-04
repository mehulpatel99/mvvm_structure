
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/Repository/auth_repository.dart';
import 'package:mvvm/Utills/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  Future<void> loginApi(BuildContext context,Map data)async{
   _myRepo.loginApi(data).then((value){
     Utils.flushBar("Login Successfully", context);
     if(kDebugMode){
       print(value.toString());
     }
   }).onError((error,stackTrace){
    Utils.flushBar(error.toString(), context);
     if(kDebugMode){
       print(error.toString());
     }
   });
  }
}