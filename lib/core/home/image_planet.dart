import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/core/text.dart';


Widget imagePlanetaHome(BuildContext context, int alto){
   const String assetName = 'assets/images/one.svg';
    final Widget svg = SvgPicture.asset(assetName,semanticsLabel: 'Planet');
    
    return  SizedBox(
      height: alto.h, 
      child: svg );                                 
}




Widget imageAndTitle(BuildContext context, int alto, int sizeLetra){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      imagePlanetaHome(context, alto),
      SizedBox(height: 1.h,),
      TextPlanet(
              title: 'Planets', 
              colorText: const Color(0xff000000), 
              dimen:  sizeLetra.sp ,
              onPressed: (){},
              sombra: true,
             ), 
    ],
  );
}

