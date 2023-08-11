import 'package:flutter/material.dart';

class SearchNote extends StatelessWidget {
  const SearchNote({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 27.0, vertical: 88.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 30.0),
                  filled: true,
                  border: const UnderlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search by the keyword...',
                  hintStyle: Theme.of(context).textTheme.headlineSmall?.merge(
                        const TextStyle(
                          color: Color.fromRGBO(204, 204, 204, 1),
                        ),
                      ),
                ),
                style: Theme.of(context).textTheme.headlineSmall?.merge(
                      const TextStyle(
                        color: Color.fromRGBO(204, 204, 204, 1),
                      ),
                    ),
              ),
            ),
            Center(
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
                        'File not found. Try searching again.',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
