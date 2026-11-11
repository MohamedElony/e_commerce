import 'package:flutter/material.dart';

class DeliveryComponent extends StatelessWidget {
  const DeliveryComponent({
    super.key,
    required this.imgUrl,
    required this.days, // أضفنا الـ days عشان تعرض المدة المتطابقة مع التصميم
  });

  final String imgUrl;
  final String days;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        color: Colors.white, // خلفية بيضاء
        borderRadius: BorderRadius.circular(16), // تدوير الحواف بالشكل المطلوب
        elevation: 2, // إضافة ظل خفيف للزر
        shadowColor: Colors.black.withValues(alpha: 0.1),
        child: Container(
          width: 100, // عرض مناسب للكارت يشبه التصميم
          height: 90, // ارتفاع مناسب ليحتوي الصورة والمدة
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // صورة شركة الشحن (FedEx, USPS, DHL)
              SizedBox(
                height: 36, // تحكم في ارتفاع اللوجو
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.local_shipping, size: 30);
                  },
                ),
              ),
              const SizedBox(height: 8),
              // النص الخاص بالمدة (مثلاً: 2-3 days) بلون رمادي هادئ مثل الصورة
              Text(
                days,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}