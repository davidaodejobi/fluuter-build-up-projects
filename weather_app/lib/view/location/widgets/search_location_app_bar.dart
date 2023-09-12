// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchLocationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchLocationAppBar({
    required this.addLocation,
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;
  final VoidCallback addLocation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 20.0,
        ),
      ),
      title: Text('Select City', style: Theme.of(context).textTheme.titleLarge),
      actions: [
        GestureDetector(
          onTap: addLocation,
          child: const Icon(
            Icons.add,
          ),
        ),
        const SizedBox(
          width: 20.0,
        )
      ],
    );
  }
}
