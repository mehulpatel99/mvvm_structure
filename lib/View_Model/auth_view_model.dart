
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/Repository/auth_repository.dart';
import 'package:mvvm/Utills/Routes/routes_name.dart';
import 'package:mvvm/Utills/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();


  bool _loading = false;
  bool get loading => _loading;

  bool _signUploading = false;
  bool get signUploading => _signUploading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  setSignUpLoading(bool value){
    _signUploading = value;
    notifyListeners();
  }

   Future<dynamic> loginApi(BuildContext context,Map data)async{
    setLoading(true);
    try {
      var value = await _myRepo.loginApi(data); // Await the API call here
      setLoading(false);
      Utils.flushBar("Login Successfully", context);
      if (kDebugMode) {
        print(value.toString());
      }
      return value; // Return the response here
    } catch (error) {
      setLoading(false);
      Utils.flushBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
      rethrow; // Re-throw the error to handle it in the second class
    }
   //
   //    _myRepo.loginApi(data).then((value){
   //   setLoading(false);
   //   // Navigator.pushNamed(context, RoutesName.home);
   //   Utils.flushBar("Login Successfully", context);
   //   return value;
   //   if(kDebugMode){
   //     print(value.toString());
   //   }
   // }).onError((error,stackTrace){
   //   setLoading(false);
   //  Utils.flushBar(error.toString(), context);
   //   if(kDebugMode){
   //     print(error.toString());
   //   }
   // });
  }

  Future<dynamic> signUpApi(BuildContext context,Map data)async{
    setSignUpLoading(true);
    try {
      var value = await _myRepo.registerApi(data); // Await the API call here
      setSignUpLoading(false);
      Utils.flushBar("SignUp Successfully", context);
      if (kDebugMode) {
        print(value.toString());
      }
      return value; // Return the response here
    } catch (error) {
      setSignUpLoading(false);
      Utils.flushBar(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
      rethrow; // Re-throw the error to handle it in the second class
    }
  }

}