import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BuildHeaderOfList extends StatelessWidget {
    BuildHeaderOfList({super.key,  required this.text, required this.header,this.onTap});
  final String text;
  final String header;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(header, style: Theme.of(context).textTheme.headlineLarge),
              InkWell(
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          Text(text,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.grey))
        ],
      ),
    );
  }
}
