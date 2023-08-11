import 'package:flutter/material.dart';

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
            Text(
              'Create your first note !',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
