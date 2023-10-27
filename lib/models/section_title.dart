import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.pressSeeAll,
  }) : super(key: key);
  final String title;
  final VoidCallback pressSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: const Color(0xFF223263),
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: pressSeeAll,
          child:  Text(
            "See More",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
              color: const Color(0xFF40BFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}