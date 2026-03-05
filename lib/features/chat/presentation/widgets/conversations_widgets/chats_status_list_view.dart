import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'chat_status_item.dart';

class ChatsStatusListView extends StatefulWidget {
  const ChatsStatusListView({
    super.key,
  });

  @override
  State<ChatsStatusListView> createState() => _ChatsStatusListViewState();
}

class _ChatsStatusListViewState extends State<ChatsStatusListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<String> status = [
      context.l10n.all,
      context.l10n.upcoming,
      context.l10n.completed,
      context.l10n.live,
    ];
    return ListView.separated(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return ChatStatusItem(
          isSelected: selectedIndex == index,
          title: status[index],
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 8);
      },
      itemCount: status.length,
    );
  }
}
