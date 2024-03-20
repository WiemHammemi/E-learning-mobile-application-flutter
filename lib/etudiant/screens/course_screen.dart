import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pfa2/widgets/description_section.dart';
import 'package:pfa2/widgets/video_section.dart';

class CourseScreen extends StatefulWidget{
  String img;
  CourseScreen(this.img);

  @override 
  State<CourseScreen> createState()=> _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen>{
  bool isVedioSection = true;
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation:0 ,
        centerTitle: true,
        title: Text(widget.img, 
        style :TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing:1,
          ),
          ),
          actions: [ 
            Padding(padding: EdgeInsets.only(right: 10),
            child:Icon(
              Icons.notifications,
              size:28,
              color:Color.fromARGB(255, 2, 44, 141),
              ),
             ),

          ],
      ),
      body: Padding(padding: EdgeInsets.symmetric(vertical:10, horizontal: 20),
      child: ListView( 
        children: [ 
          Container ( 
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(20),
              color:Color(0xFFF5F3FF),

              image: DecorationImage(
                image: AssetImage("images/${widget.img}.png"),
                ),
            ),
            child:Center(
              child: Container( 
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration( 
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                Icons.play_arrow_rounded,
                color:Color.fromARGB(255, 2, 44, 141),
                size:45, 
                ),
              ),
              ),
          ),
          SizedBox(height:15 ,),
          Text("${widget.img} Complete Course ",
          style : TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          ),
          SizedBox(height: 5,),
          //Text("Created by .... ",style: TextStyle(
          //fontSize:16,
          //fontWeight: FontWeight.w500,
          //color:Colors.black.withOpacity(0.7),
          //),),
          SizedBox(height:5 ,),
          Text("55 Vedios", 
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black.withOpacity(0.5),

          ),
          ),
          SizedBox(height: 20,),
          Container( 
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration( 
              color: Color(0xFFF5F3FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [ 
                Material( 
                  color:isVedioSection ? Color.fromARGB(255, 2, 44, 141):Color.fromARGB(255, 2, 44, 141).withOpacity(0.6) ,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell( 
                    onTap: (){
                      setState(() {
                        isVedioSection=true;
                        
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:15 , horizontal: 35),
                      child: Text( 
                        "Vedios", 
                        style : TextStyle( 
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,

                        )
                      )
                    ),
                    
                  )
                ),
                Material( 
                  color: isVedioSection ? Color.fromARGB(255, 2, 44, 141).withOpacity(0.6):Color.fromARGB(255, 2, 44, 141) ,
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell( 
                    onTap: (){
                      setState(() {
                        isVedioSection=false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical:15 , horizontal: 35),
                      child: Text( 
                        "Description", 
                        style : TextStyle( 
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,

                        )
                      )
                    ),
                    
                  )
                ),
                
              ],
            ),
          ),
          SizedBox(height: 10,),
          isVedioSection ? VedioSection() : DescriptionSection(),

          

          
        ],
      ))
    );
  }
}