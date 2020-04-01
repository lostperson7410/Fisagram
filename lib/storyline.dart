import 'package:flutter/material.dart';

var firstSection = Container(color: Colors.greenAccent,width: 200,child: Image.network("https://scontent.fbkk14-1.fna.fbcdn.net/v/t1.0-9/66476314_2261549130587928_2186526674542133248_o.jpg?_nc_cat=106&_nc_sid=dd9801&_nc_ohc=1fidT1mYxlAAX92hjD4&_nc_ht=scontent.fbkk14-1.fna&oh=c336a26c719224bccee690dbc0e733cb&oe=5E9111F4"),);



class FirstSection extends StatefulWidget{
  @override
  _firstSectionState createState() => _firstSectionState();
}

class _firstSectionState extends State<FirstSection>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return firstSection;
  }

}

