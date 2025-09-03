// ignore_for_file: deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/core/detail/favorite.dart';
import 'package:tres_astronautas/core/home/boton_ver_planetas_appbar.dart';
import 'package:tres_astronautas/core/text.dart';
import 'package:tres_astronautas/data/planet.dart';
import 'package:tres_astronautas/presentation/planet_list_page.dart';


PreferredSizeWidget appBarHomeMobile(
   BuildContext context, 
   String? displayName, 
   String typeView,
   ){
   return AppBar(
      title: Column(
         crossAxisAlignment: CrossAxisAlignment.start, 
         children: [
             Center(
               child: Row(                 
                 children: [
                   SizedBox( width: 2.h,),
                   logoAppBar(context),
                   SizedBox( width: 2.h,),
                   Text('$displayName'  ,
                        style: TextStyle(
                        fontSize: 18.sp, 
                        fontFamily: 'Georgia', 
                        fontStyle: FontStyle.italic, 
                        ),
                        textAlign: TextAlign.center,
                   ),
                 ],
               ),
             ),
             const  SizedBox(height: 3,),          
          ],
      ),
      backgroundColor: const Color(0xff000000),  
      foregroundColor: const Color(0xffffffff),
      toolbarHeight: kIsWeb ? 15.h : 10.h ,
     // automaticallyImplyLeading: typeView == 'home' ? false : true,     
     
   );
 }






PreferredSizeWidget appBarHomeDetail(
   BuildContext context, 
   String? displayName, 
   String typeView,
   Planet planet
   ){
   return AppBar(
      title: Column(
         crossAxisAlignment: CrossAxisAlignment.start, 
         children: [
             Center(
               child: Row(                 
                 children: [
                   SizedBox( width: 2.h,),
                   logoAppBar(context),
                   SizedBox( width: 2.h,),
                   Text('$displayName'  ,
                        style: TextStyle(
                        fontSize: 18.sp, 
                        fontFamily: 'Georgia', 
                        fontStyle: FontStyle.italic, 
                        ),
                        textAlign: TextAlign.center,
                   ),
                 ],
               ),
             ),
             const  SizedBox(height: 3,),          
          ],
      ),
      backgroundColor: const Color(0xff000000),  
      foregroundColor: const Color(0xffffffff),
      toolbarHeight: kIsWeb ? 15.h : 10.h ,
   // automaticallyImplyLeading: typeView == 'home' ? false : true,     
       actions: [
         Builder(
           builder: (context) => Row(
             children: [
              typeView  == 'detail'   ? const SizedBox() :
                FavoritePlanetIcon(planet: planet,),
        SizedBox(width: 5.h),
      ],
    ),
  ),
],
   );
 }







PreferredSizeWidget appBarHomeWeb(
   BuildContext context, 
   String? displayName, 
   String typeView){
   return AppBar(
      title: Column(
         crossAxisAlignment: CrossAxisAlignment.start, 
         children: [
             Center(
               child: Row(                 
                 children: [
                   SizedBox( width: 2.h,),
                   logoAppBar(context),
                   SizedBox( width: 2.h,),
                   TextPlanet(
                     title:  '$displayName',
                     colorText: Color(0xffffffff),
                     dimen: 18.sp,
                     onPressed: (){},
                     sombra: true,              
                   ),
                 ],
               ),
             ),
             const  SizedBox(height: 3,),
          
          ],
      ),
      backgroundColor: const Color(0xff000000),  
      foregroundColor: const Color(0xffffffff),
      toolbarHeight: kIsWeb ? 15.h : 10.h ,
      automaticallyImplyLeading: typeView == 'home' ? false : true,
      actions: [
         Builder(
           builder: (context) => Row(
             children: [
              typeView  == 'detail' ||
                MediaQuery.of(context).size.width < 600  ? const SizedBox() :
                BotonVerPlanetsAppbar(
                  title: 'Ver Planetas',
                  colorText: const Color(0xffffffff),
                  size: 16.sp,
                  onPressed: () {
                    context.pushNamed(PlanetListPage.name);
                  },  
                ),
        SizedBox(width: 5.h),
      ],
    ),
  ),
],
   );
 }






Container logoAppBar(BuildContext context) {
  return Container(
    height: kIsWeb ? 10.h :  6.h,
    width: kIsWeb ? 10.h : 6.h, 
    decoration: BoxDecoration(
      shape: BoxShape.circle, 
      color: const Color(0xffffffff)
      //.withOpacity(0.8),
    ),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipOval( 
        child: SizedBox(
          child: Image.asset('assets/images/logo.jpg', fit: BoxFit.contain,),
        ),
      ),
    ),
  );
}