import 'package:flutter/material.dart';

import '../../../shared/navigate_ to_create_page.dart';

class EmptyNotePlaceholder extends StatelessWidget {
  const EmptyNotePlaceholder({
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
              'assets/images/empty-note.png',
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () => {createNotePage(context)},
              child: Text(
                'Create your first note !',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
