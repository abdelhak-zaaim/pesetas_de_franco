import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/dimensions.dart';
import '../utils/root_helper.dart';
import 'base/custom_small_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for the content

      body: Stack(
    children: <Widget>[

      Image.asset(
        'assets/images/background.png', // Replace with your background image path
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill, // Adjust the fit as needed
      ),

      Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[





            const SizedBox(height:285),
          //  Text(
          //    'Céntimos dePeseta',
          //      textAlign: TextAlign.center,
          //    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).primaryColor , fontSize: 35, fontWeight: FontWeight.w900  ),
          //  ),

            Image.asset(
              fit: BoxFit.cover,
              'assets/images/icon_b.jpeg', // Replace with your coin logo image path
              width: 250,
              height: 250,
            ),


            const SizedBox(height: 20),
            Text(
              '1936 - 1975', // Replace with actual coin year
              style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Theme.of(context).primaryColor, fontSize: 30),
            ),
            const Expanded(child: SizedBox()
            )
           , SizedBox(height: 40),
            Container(
              width: context.width * 0.7,
              padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault, right: Dimensions.paddingSizeDefault, bottom: Dimensions.paddingSizeExtraExtraLarge),
              child: CustomSmallButton(
              onTap: () => Get.toNamed(RouteHelper.getHomeRoute()),
                backgroundColor: Theme.of(context).secondaryHeaderColor,
                text: 'INICIAR',
                textSize: 23,
                textColor:Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ],
        ),
      ),
    ]
      ),
    );
  }
}