import 'package:flutter/material.dart';

class additionalInfo extends StatelessWidget {

  final IconData icon;
  final String label;
  final String temp;
   additionalInfo({super.key,
   required this.icon,
     required this.label,
     required this.temp,

   });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon as IconData?,size: 40,),

        Text(label,style: TextStyle(fontSize: 20),),

        Text(temp,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 21)),

      ],
    );
  }
}
