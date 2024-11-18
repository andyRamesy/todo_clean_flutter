import 'package:todo_clean/domain/entities/unique_id.dart';

class TodoEntry {
  final String description;
  final bool isDone;
  final EntryId id;

  const TodoEntry(
      {required this.description, required this.isDone, required this.id});

  factory TodoEntry.empty() {
    return TodoEntry(
      description: '',
      isDone: false,
      id: EntryId(),
    );
  }
}
