import 'package:flutter/material.dart';

class TodoEntryItemError extends StatelessWidget {
  const TodoEntryItemError({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: Icon(Icons.warning_amber_rounded),
      title: Text('could not load item'),
    );
  }
}
