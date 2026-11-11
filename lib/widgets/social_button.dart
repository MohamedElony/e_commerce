// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

Widget buildSocialButton({
  required String assetPath,
  required VoidCallback onTap,
  double? widthLogo,
  double? heightLogo,
  double? widthContainer,
  double? heightContainer,
}) {
  return Material(
    color: Colors.white, // خلفية بيضاء
    borderRadius: BorderRadius.circular(16), // تدوير الحواف بالشكل المطلوب
    elevation: 2, // إضافة ظل خفيف للزر
    shadowColor: Colors.black.withOpacity(0.1),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        16,
      ), // لتوافق تأثير اللمس مع الحواف المدورة

      child: Container(
        width: widthContainer ?? 92,
        height: heightContainer ?? 64,
        alignment: Alignment.center,
        child: SizedBox(
          width:
              widthLogo ?? 55, // تحكم في حجم الأيقونة داخلياً لكي لا تكون ضخمة
          height: heightLogo ?? 55,

          child: Image.asset(assetPath),
        ),
      ),
    ),
  );
}
