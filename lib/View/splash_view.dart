import 'package:flutter/cupertino.dart';

import '../View_Model/Services/splash_service.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashService splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Splash Screen",style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
    );
  }
}
