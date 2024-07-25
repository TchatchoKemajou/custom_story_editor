import 'package:flutter/material.dart';



class CustomBottomButton extends StatelessWidget {
  const CustomBottomButton({
    super.key,
    required this.text,
    this.leftIcon,
    this.color,
    this.rightIcon,
    this.height,
    this.onTap,
    this.boxShadow,
    this.style,
    this.width, this.isBorder, this.boderColor, this.radius, this.horizontalPadding,
  });

  final String text;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Color? boderColor;
  final Color? color;
  final double? height;
  final double? width;
  final double? horizontalPadding;
  final TextStyle? style;
  final double? radius;
  final bool? isBorder;
  final VoidCallback? onTap;
  final List<BoxShadow>? boxShadow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 50,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 15,),
        decoration: BoxDecoration(
            color: color ?? const Color(0xFFFC9501),
            borderRadius: BorderRadius.circular(radius ?? 25),
            border: isBorder != null && isBorder == true ? Border.all(color: boderColor ?? Colors.grey) : null,
            boxShadow: boxShadow),
        child: Row(
          mainAxisAlignment: text == "" ? MainAxisAlignment.spaceBetween  : MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            leftIcon ?? const SizedBox(width: 0,),
            const SizedBox(width: 10,),
            Text(
              text,
              softWrap: true,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: style ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(width: 10,),
            rightIcon ?? const SizedBox(width: 0,),
          ],
        ),
      ),
    );
  }
}
