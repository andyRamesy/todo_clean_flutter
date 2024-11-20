import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/use_cases/load_todo_entry_ids_for_collections.dart';

part 'todo_detail_cubit_state.dart';

class TodoDetailCubit extends Cubit<TodoDetailCubitState> {
  final LoadTodoEntryIdsForCollections loadTodoEntryIdsForCollections;
  final CollectionId collectionId;

  TodoDetailCubit({
    required this.loadTodoEntryIdsForCollections,
    required this.collectionId,
  }) : super(TodoDetailCubitLoadingState());

  Future<void> fetch() async {
    emit(TodoDetailCubitLoadingState());

    try {
      final entryIds = await loadTodoEntryIdsForCollections
          .call(CollectionIdParam(collectionId: collectionId));
      if (entryIds.isLeft) {
        emit(TodoDetailCubitErrorState());
      } else {
        emit(TodoDetailCubitLoadedState(entryIds: entryIds.right));
      }
    } on Exception {
      emit(TodoDetailCubitErrorState());
    }
  }
}
