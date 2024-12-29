import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Mymvvm(),
    );
  }
}
class Mymvvm extends StatefulWidget {
  const Mymvvm({super.key});

  @override
  State<Mymvvm> createState() => _MymvvmState();
}

class _MymvvmState extends State<Mymvvm> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
