import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_clean/application/pages/detail/todo_detail_page.dart';
import 'package:todo_clean/domain/entities/todo_collection.dart';

class TodoOverviewLoaded extends StatelessWidget {
  final List<TodoCollection> collections;

  const TodoOverviewLoaded({
    super.key,
    required this.collections,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: collections.length,
      itemBuilder: (context, index) {
        final item = collections[index];
        final colorScheme = Theme.of(context).colorScheme;

        return ListTile(
          tileColor: colorScheme.surface,
          selectedTileColor: colorScheme.onSurfaceVariant,
          iconColor: item.color.color,
          selectedColor: item.color.color,
          onTap: () {
            context.pushNamed(
            TodoDetailPage.pageConfig.name,
            pathParameters: {'collectionId': item.id.value},
          );
          print("item id: ${item.id.value}");
          },
          leading: const Icon(Icons.circle),
          title: Text(item.title),
        );
      },
    );
  }
}
