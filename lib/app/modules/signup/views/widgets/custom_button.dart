import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:todo_firebase/app/data/app_color.dart';

class CustomButton extends StatelessWidget {
  final String? title, icon;
  final double? height, width, fontSize;
  final Callback? onPress;
  
  const CustomButton(
      {super.key,
      this.title,
      this.icon,
      this.height,
      this.width,
      this.fontSize,
      this.onPress,  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
            color: AppColor.lightpurple,
            borderRadius: BorderRadius.circular(4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
              style: TextStyle(
                  color: AppColor.secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize ?? 13),
            ),
            const SizedBox(
              width: 5,
            ),
            icon != null
                ? SvgPicture.asset(
                    icon.toString(),
                    width: 14,
                    height: 14,
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
