import 'package:flutter/material.dart';
Widget appBar(BuildContext context){
  return Center(
    child: RichText(
      text: TextSpan(
        text: 'Quiz',
        style: TextStyle(fontSize: 24,color: Colors.black54,fontWeight: FontWeight.w600),
        children: const <TextSpan>[
          TextSpan(text: 'Time         ', style: TextStyle(fontSize:24,fontWeight: FontWeight.w600,color: Colors.purple)),

        ],
      ),
    ),
  );
}