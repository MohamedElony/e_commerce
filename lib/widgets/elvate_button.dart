import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const MainButton({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onTap,
      
      style: ElevatedButton.styleFrom(
        backgroundColor: MyAppColor.primaryColor,
        
        
      ),
       child: Text(text,
      style: Theme.of(context).textTheme.headlineSmall,)),
    );
  }
}
