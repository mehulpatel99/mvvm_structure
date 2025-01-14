import 'package:flutter/material.dart';
import 'package:mvvm/Utills/Routes/routes_name.dart';
import 'package:mvvm/View_Model/user_view_model.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final sessionManager = Provider.of<UserViewModel>(context);
    return  Scaffold(
      body: Center(
        child: InkWell(
            onTap: (){
              sessionManager.remove().then((value){
                Navigator.pushNamed(context, RoutesName.login);
              });
            },
            child: Text("LogOut")),
      ),
    );
  }
}
