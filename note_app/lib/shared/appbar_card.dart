import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_app/constants/app_colors.dart';

class AppBarCard extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final bool isFirst;
  const AppBarCard({
    Key? key,
    required this.icon,
    required this.onTap,
    required this.isFirst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: EdgeInsets.only(
          left: isFirst ? 10 : 0,
          right: isFirst ? 12 : 16,
          top: 8,
          bottom: 8,
        ),
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(
          'assets/svgs/$icon.svg',
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
