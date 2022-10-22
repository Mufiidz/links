import 'package:flutter/material.dart';

import '../../../models/link.dart';
import '../../../utils/utils_export.dart';

class ItemLinkWidget extends StatelessWidget {
  final Link link;
  const ItemLinkWidget({
    Key? key,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        constraints: const BoxConstraints(minHeight: 65),
        child: Card(
          shape: const StadiumBorder(),
          child: InkWell(
            customBorder: const StadiumBorder(),
            onTap: () {
              if (link.link.isNotEmpty) {
                OpenLink.withLink(link.link);
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Center(
                child: Text(
                  link.title.capitalEachWord(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
