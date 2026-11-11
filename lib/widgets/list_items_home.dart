import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:e_commerce/presentation/product_details.dart';
import 'package:e_commerce/widgets/rating.dart';
import 'package:flutter/material.dart';

class ListItemsHome extends StatelessWidget {
  const ListItemsHome({
    super.key,
    required this.discount,
    required this.imgUrl,
    required this.category,
    required this.title,
    required this.price,
    this.rate,
  });
  final int discount;
  final String imgUrl;
  final String category;
  final String title;
  final double price;
  final double? rate;
  @override
  Widget build(BuildContext context) {
    double priceAfterDiscunt = price - (price * discount / 100);

    return SizedBox(
      width: 160,
      height: 300,
      child: DecoratedBox(
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                    height: 190,
                    width: double.infinity,
                  ),

                  discount == 0
                      ? SizedBox.shrink()
                      : Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: MyAppColor.primaryColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          margin: EdgeInsets.all(5),
                          width: 40,
                          height: 24,
                          child: Text(
                            '$discount%',
                            style: Theme.of(context).textTheme.bodySmall!
                                .copyWith(color: Colors.white),
                          ),
                        ),

                  SizedBox(
                    height: 190,

                    child: Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: FavouriteIcon(),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              rate == 0
                  ? const SizedBox.shrink()
                  : Row(
                      children: [
                        Rating(rate: rate),
                        Text('($rate)'),
                      ],
                    ),
              Text(
                category,
                style: Theme.of(context).textTheme.bodyLarge!
                    .copyWith(color: Colors.grey),
              ),
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              price == priceAfterDiscunt
                  ? Text(
                      '$price \$',
                      style: TextStyle(
                        color: MyAppColor.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : RichText(
                      text: TextSpan(
                        children: [
                          // السعر القديم المشطوب
                          TextSpan(
                            text: '$price\$ ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          // السعر الجديد بعد الخصم
                          TextSpan(
                            text: '$priceAfterDiscunt\$',
                            style: TextStyle(
                              color: MyAppColor.primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
              // Text(
              //   '$price\$',
              //   style: Theme.of(context).textTheme.headlineSmall!
              //       .copyWith(color: Colors.grey),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

