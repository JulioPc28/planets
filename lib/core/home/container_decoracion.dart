// ignore_for_file: deprecated_member_use, sized_box_for_whitespace
import 'package:flutter/material.dart';

Widget containerColorStar (BuildContext context){
  return Row(
    children: [
      Container(
      color: Color(0xffBA2DA3),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.01,
      ),
      Container(
      color: Color(0xffFFF95E),
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.01,
      ),
    ],
  );
}

Widget containerColorEnd (BuildContext context){
  return Row(
    children: [
      
      Container(
      color: Color(0xffFFF95E),
      width: MediaQuery.of(context).size.width * 0.1,
      height: MediaQuery.of(context).size.height * 0.01,
      ),
      Container(
      color: Color(0xffBA2DA3),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.01,
      ),
    ],
  );
}











