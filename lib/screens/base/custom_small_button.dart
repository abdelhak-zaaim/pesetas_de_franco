
import 'package:flutter/material.dart';


import '../../utils/dimensions.dart';
import '../../utils/styles.dart';

class CustomSmallButton extends StatelessWidget {
  final String? text;
  final Function onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final double textSize;
  const CustomSmallButton({Key? key, 
    this.backgroundColor,
    required this.onTap,
    this.text,
    required this.textColor,
    this.textSize = Dimensions.fontSizeExtraLarge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Shadow color
            offset: Offset(0, 4), // Vertical and horizontal offset
            blurRadius: 6, // Spread or blur radius
            spreadRadius: 1, // How much the shadow should spread
          ),
        ],
      ),
      child: TextButton(
        onPressed: onTap as void Function()?,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeDefault),
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
          ),
        ),
        child: Text(
          text!,
          style: rubikRegular.copyWith(
            color: textColor,
            fontSize: textSize,
            fontFamily:'Rubik',
          ),
        ),
      ),
    )
    ;
  }
  //Dimensions.FONT_SIZE_EXTRA_LARGE
}
