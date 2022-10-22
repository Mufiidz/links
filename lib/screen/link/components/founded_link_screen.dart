import 'package:flutter/material.dart';

class FoundedLinkScreen extends StatelessWidget {
  final String link;
  const FoundedLinkScreen(this.link, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      heightFactor: 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'You\'re being redirected to another page',
          ),
          const CircularProgressIndicator(),
          Text(
            'Please wait to be automatically redirected to the $link',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
