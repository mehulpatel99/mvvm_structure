import 'package:flutter/material.dart';
import 'package:mvvm/Utills/Routes/routes_name.dart';
import 'package:mvvm/View_Model/auth_view_model.dart';
import 'package:mvvm/View_Model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'Utills/Routes/routes.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(providers: [
     ChangeNotifierProvider(create: (_) => AuthViewModel()),
     ChangeNotifierProvider(create: (_) => UserViewModel()),
    ],
    child: const MaterialApp(
      initialRoute: RoutesName.login,
      onGenerateRoute: Routes.generateRoute,
    ),
    );
  }
}
