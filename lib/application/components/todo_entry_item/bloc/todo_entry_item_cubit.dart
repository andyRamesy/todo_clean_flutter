import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/todo_entry.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/use_cases/load_todo_entry.dart';
import 'package:todo_clean/domain/use_cases/update_todo_entry.dart';

part 'todo_entry_item_cubit_state.dart';

class TodoEntryItemCubit extends Cubit<TodoEntryItemState> {
  final EntryId entryId;
  final CollectionId collectionId;
  final LoadTodoEntry loadTodoEntry;
  final UpdateTodoEntry updateTodoEntry;

  TodoEntryItemCubit({
    required this.entryId,
    required this.collectionId,
    required this.loadTodoEntry,
    required this.updateTodoEntry,
  }) : super(ToDoEntryItemLoadingState());

  Future<void> fetch() async {
    try {
      final entry = await loadTodoEntry.call(
        TodoEntryIdParam(
          entryId: entryId,
          collectionId: collectionId,
        ),
      );

      return entry.fold(
        (left) => emit(ToDoEntryItemErrorState()),
        (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)),
      );
    } on Exception {
      emit(ToDoEntryItemErrorState());
    }
  }

  Future<void> update() async {
    try {
      final updatedEntry = await updateTodoEntry
          .call(TodoEntryIdParam(collectionId: collectionId, entryId: entryId));

      return updatedEntry.fold(
        (left) => emit(ToDoEntryItemErrorState()),
        (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)),
      );
    } on Exception {
      emit(ToDoEntryItemErrorState());
    }
  }
}
