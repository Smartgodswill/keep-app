// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class Fileshowup extends StatelessWidget {
  
  final String child;
  final VoidCallback onTap;
   Fileshowup({super.key,required this.child,required this.onTap});

    var mycolor=Colors.purple;

  @override
  Widget build(BuildContext context) {
    if(child=='C'){
      mycolor=Colors.green;
    }else if(child=='DEL'){
      mycolor=Colors.red;
    }else if(child=='='){
      mycolor=Colors.pink;
    }
    return Padding(
                      padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                   child: GestureDetector(
                    onTap: onTap,
                     child: Container(
                          decoration: BoxDecoration(
                             color: mycolor,
                            borderRadius: BorderRadius.circular(10)
                          ),
                         
                          height: 200,
                          width: 200,
                          child: Center(child: Text(child,style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                        
                          
                          
                        ),
                   ),
                    ) ;
  }
}