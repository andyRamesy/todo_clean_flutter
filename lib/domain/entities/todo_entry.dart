import 'package:equatable/equatable.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';

class TodoEntry extends Equatable {
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

  TodoEntry copyWith({String? description, bool? isDone}) {
    return TodoEntry(
        description: description ?? this.description,
        id: id,
        isDone: isDone ?? this.isDone);
  }

  @override
  List<Object> get props => [id, isDone, description];
}
