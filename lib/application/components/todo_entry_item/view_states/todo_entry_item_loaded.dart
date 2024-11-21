import 'package:flutter/material.dart';
import 'package:todo_clean/domain/entities/todo_entry.dart';

class TodoEntryItemLoaded extends StatelessWidget {
  final TodoEntry entryItem;

  const TodoEntryItemLoaded({super.key, required this.entryItem});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(entryItem.description),
      onChanged: (value) {},
      value: entryItem.isDone,
    );
  }
}
