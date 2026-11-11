import 'package:flutter/material.dart';

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
    required this.imgUrl,
    required this.title,
    this.size,
    this.color,
    required this.price,
    required this.discount,
  });
  final String imgUrl;
  final String title;
  final String? size;
  final String? color;
  final double price;
  final int discount;

  @override
  Widget build(BuildContext context) {
    double priceAfterDiscunt = price - (price * (discount / 100));

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 104,
        width: 104,
        child: Row(
          children: [
            Image.network(
              height: 104,
              width: 104,
              imgUrl,
              fit: BoxFit.cover,
              alignment: AlignmentGeometry.topCenter,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: 20,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_vert),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Color: $color',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Size: $size',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                        SizedBox(width: 90,),
                        
                        Text(
                          ' $priceAfterDiscunt\$',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
