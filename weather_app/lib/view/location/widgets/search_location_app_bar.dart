// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchLocationAppBar extends StatelessWidget {
  const SearchLocationAppBar({
    Key? key,
    required this.addLocation,
  }) : super(key: key);
  final VoidCallback addLocation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20.0,
              ),
            ),
            Text('Select City', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        GestureDetector(
          onTap: addLocation,
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
