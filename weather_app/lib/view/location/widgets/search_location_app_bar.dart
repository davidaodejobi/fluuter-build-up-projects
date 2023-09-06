import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';

class SearchLocationAppBar extends StatelessWidget {
  const SearchLocationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: AppColors.lightTextColor,
                size: 15.0,
              ),
            ),
            Text('Select City', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const Icon(
          Icons.add,
          color: AppColors.lightTextColor,
        ),
      ],
    );
  }
}
