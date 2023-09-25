import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/models/category.dart';
import 'package:untitled2/models/section_title.dart';
import '../../../constants.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Category",
            pressSeeAll: () {},
          ),
        ),
    SizedBox(
    height: 85,
    child: ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: demo_categories.length,
    itemBuilder: (context, index) => CategoryCard(
    icon: demo_categories[index].icon,
    title: demo_categories[index].title,
    press: () {},
    ),
    separatorBuilder: (context, index) =>
    const SizedBox(width: defaultPadding),
    ),
    ),
      ],
    );

  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String icon, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(

      onPressed: press,
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 20, horizontal: 5),
        child: Column(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: defaultPadding / 2),
            Text(
              title,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0xFF969AA8),
              ),
            )
          ],
        ),
      ),
    );
  }
}