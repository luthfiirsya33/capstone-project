import 'package:capstone_project_sib_kwi/common/constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback press;

  const CategoryCard({
    Key? key, required this.title, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: press,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: whiteColor70,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
              child: Text(
                title,
                style: greyTextStyle.copyWith(fontSize: 15, fontWeight: regular),
              ),
            ),
          ),
        ),
      ),
    );
  }
}