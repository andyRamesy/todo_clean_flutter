import 'package:todo_clean/domain/entities/todo_color.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';

class TodoCollection {
  final String title;
  final CollectionId id;
  final TodoColor color;

  TodoCollection({required this.id, required this.title, required this.color});

  factory TodoCollection.empty() {
    return TodoCollection(
        id: CollectionId(), title: '', color: TodoColor(colorIndex: 0));
  }
}
