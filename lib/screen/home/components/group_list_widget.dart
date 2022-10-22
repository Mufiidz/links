import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mylink/utils/utils_export.dart';

import '../../../models/link.dart';
import '../bloc/home_bloc.dart';
import 'item_link_widget.dart';

class GroupListWidget extends StatelessWidget {
  final LinksDataState state;
  const GroupListWidget(this.state, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GroupedListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      elements: state.listLinks,
      groupBy: (Link link) => link.category,
      groupSeparatorBuilder: (value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            value.capitalEachWord(),
            style:
                context.textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
        ),
      ),
      itemBuilder: (context, element) => ItemLinkWidget(link: element),
    );
  }
}
