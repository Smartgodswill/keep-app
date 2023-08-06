
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:keepapp/model/fileshow.dart';
import 'package:keepapp/model/myansshow.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of items showing on the gridview containers
  List<String>myindexlist =[
    '1',
    '2',
    '3',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '7',
    '8',
    '9',
    '=',
    '0',
  ];
    int num1=2;
    int num2=5;
      String useranswer='';
    // from dartmath pick random numbers
       var random=Random();
       //move a user to a next question
      void gotonextquestion(){
       tryagain();
        num1=random.nextInt(10);
        num2=random.nextInt(10);
        setState(() {
          useranswer='';
        });
        
      }
      // give user an ability to try again
      void tryagain(){
        Navigator.of(context).pop();
        setState(() {
          useranswer='';
        });
       
      }
      void checkresult(){
        //checking if correct show the following else show the other
        if(num2+num1==int.parse(useranswer)){
        showDialog(context: context, builder:(context){
              return Myansshow(text:'Correct' ,ontap:gotonextquestion ,icon:Icons.arrow_forward ,) ;   
        });
        }else{
         showDialog(context: context, builder:(context){
              return Myansshow(text:'Incorrect' ,ontap:tryagain ,icon:Icons.rotate_left ,) ;   
        });

        }

      }
       void datapassed(String button){
        // setstate  enable cahnges 
        setState(() {

          if(button=='='){
            checkresult();
          }
          // if it item 'c'just keep everything empty
           else if(button=='C'){
              useranswer='';
              // if item is"DEL" just keep removing one item from the  containers
            } else if(button=='DEL'){
              if(useranswer.isNotEmpty){
                useranswer=useranswer.substring(0,useranswer.length-1);
              }
              // here user is able to type each container
            } else if(useranswer.length<3){
          useranswer+=button;
         }
        });    
   }
    
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        backgroundColor: const Color.fromARGB(255, 51, 20, 56),
        body: Column(
          children: [
            Container(
              height: 140,
              color: const Color.fromARGB(255, 41, 3, 48),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(255, 71, 10, 71),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // passing in the int tostring
                   Text(num1.toString()+'+'+num2.toString()+'=',style: const TextStyle(fontSize: 33,fontWeight: FontWeight.bold),),
                    Container(
                      decoration: BoxDecoration(
                         color:const  Color.fromARGB(255, 5, 68, 7),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      height: 50,
                      width: 100,
                      child: Center(child: Text( useranswer,style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: 
            Padding(
              padding: const EdgeInsets.only(top: 29),
              child: GridView.builder(
                physics:const  NeverScrollableScrollPhysics(),
                itemCount: myindexlist.length,
                gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4), itemBuilder: (context,index){
                return  Fileshowup(onTap: () {
                  return
                 datapassed(myindexlist[index]);
                },
                child: myindexlist[index], );
  }),
         ))]));}
  }