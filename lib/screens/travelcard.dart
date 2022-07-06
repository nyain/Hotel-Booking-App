//Now we will create our custom widget card
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:hotel_booking_app/screens/home_screen.dart';

class travelCard extends StatefulWidget{
  travelCard({Key? key,required this.imgUrl, required this.hotelName, required this.location, required this.rating}):super(key: key);
  String imgUrl, hotelName, location;
  int rating;
  @override
  State<travelCard> createState()=>travelCardState(); 
}
class travelCardState extends State<travelCard>{
  @override
  Widget build(BuildContext context) {
  return Card(
    margin: EdgeInsets.only(right: 15.0),
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    elevation: 0.0,
    child: InkWell(
      onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()),);},
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imgUrl),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
                scale: 2.0,
                
              )),
          width: 200.0,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //this loop will allow us to add as many star as the rating
                    for (var i = 0; i < widget.rating; i++)
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.hotelName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        widget.location,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}
