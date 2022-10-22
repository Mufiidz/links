import 'package:flutter/material.dart';
import 'package:mylink/utils/utils_export.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Text(
          'Mufidz Links',
          textAlign: TextAlign.center,
          textScaleFactor: 1.2,
          style: context.textTheme.displayMedium
              ?.copyWith(fontFamily: 'Windlass', color: Colors.white),
        ),
      ),
    );
  }
}
