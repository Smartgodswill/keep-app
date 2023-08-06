// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';


class Myansshow extends StatefulWidget {
  final String text;
  final VoidCallback ontap;
  final icon;
// passing in  a constructor
  const Myansshow({super.key,required this.icon,required this.ontap,required this.text});

  @override
  State<Myansshow> createState() => _MyansshowState();
}

class _MyansshowState extends State<Myansshow> {
  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
              content: Container(
                decoration: BoxDecoration(
                   color:Colors.purple,
                  borderRadius: BorderRadius.circular(15)
                ),
                height: 200,
                width: 200,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Text(widget.text,style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
                   GestureDetector(
                    onTap:  widget.ontap,
                    child: Icon(widget.icon,size: 30,))
                  ],
                ) ,
              ),
            );
                   
  }
}