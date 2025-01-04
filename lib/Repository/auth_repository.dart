import 'package:mvvm/Data/Network/BaseApiService.dart';
import 'package:mvvm/Data/Network/NetworkApiServices.dart';
import 'package:mvvm/Resources/app_url.dart';

class AuthRepository{

  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data){
    try{
   dynamic response = _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
   return response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic> registerApi(dynamic data){
    try{
      dynamic response = _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }

}