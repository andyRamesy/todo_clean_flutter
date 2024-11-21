import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/todo_entry.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/use_cases/load_todo_entry.dart';

part 'todo_entry_item_cubit_state.dart';

class TodoEntryItemCubit extends Cubit<TodoEntryItemState> {
  final EntryId entryId;
  final CollectionId collectionId;
  final LoadTodoEntry loadTodoEntry;

  TodoEntryItemCubit({
    required this.entryId,
    required this.collectionId,
    required this.loadTodoEntry,
  }) : super(ToDoEntryItemLoadingState());

  Future<void> fetch() async {
    try {
      final entry = await loadTodoEntry
          .call(TodoEntryIdParam(entryId, collectionId: collectionId));
      return entry.fold((left) => emit(ToDoEntryItemErrorState()),
          (right) => emit(ToDoEntryItemLoadedState(toDoEntry: right)));
    } on Exception catch (e) {
      emit(ToDoEntryItemErrorState());
    }
  }

  Future<void> update() async {
    throw UnimplementedError();
  }
}