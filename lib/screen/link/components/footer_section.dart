import 'package:flutter/material.dart';
import 'package:mylink/utils/utils_export.dart';

import '../../../res/export_res.dart';

class FooterSection extends StatelessWidget {
  final bool isMobile;
  final bool isDarkMode;
  const FooterSection(
      {Key? key, this.isMobile = false, this.isDarkMode = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.mediaSize.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.logo,
            width: context.mediaSize.height * 0.1,
            height: context.mediaSize.height * 0.1,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('October 2022'),
              ));
            },
            child: Text(
              "This portfolio was developed by Rifqi Mufidianto.",
              textAlign: TextAlign.center,
              style: isMobile
                  ? TextStyle(fontSize: _getDevelopedTextSize(context))
                  : null,
            ),
          )
        ],
      ),
    );
  }

  double _getDevelopedTextSize(BuildContext context) {
    final width = context.mediaSize.width;
    return (width * (width > 350 ? 0.03 : 0.04)).toInt().toDouble();
  }
}