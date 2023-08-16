import 'package:flutter/material.dart';

class EmptySearch extends StatelessWidget {
  const EmptySearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty-search.png',
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => {},
              child: Text(
                'Result not found. Try searching again.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
