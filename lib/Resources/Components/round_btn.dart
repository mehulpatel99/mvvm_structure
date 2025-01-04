import 'package:flutter/material.dart';
import 'package:mvvm/Resources/colors.dart';

class RoundBtn extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback  onPress;
  const RoundBtn({super.key,required this.title,this.loading = false,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.btnColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: loading ? CircularProgressIndicator() : Text(title,style: TextStyle(color: AppColors.whiteColor),),
      ),
    );
  }
}
