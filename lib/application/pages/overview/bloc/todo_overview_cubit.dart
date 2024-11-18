import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/todo_collection.dart';
import 'package:todo_clean/domain/use_cases/load_todo_collections.dart';

part 'todo_overview_cubit_state.dart';

class TodoOverviewCubit extends Cubit<TodoOverviewCubitState> {
  final LoadTodoCollection loadTodoCollection;

  TodoOverviewCubit(
      {required this.loadTodoCollection, TodoOverviewCubitState? initialState})
      : super(initialState ?? TodoOverviewCubitLoadingState());

  Future<void> readTodoCollection() async {
    emit(TodoOverviewCubitLoadingState());
    try {
      final collectionsFuture = loadTodoCollection.call(NoParams());
      final collections = await collectionsFuture;

      if (collections.isLeft) {
        emit(TodoOverviewCubitErrorState());
      } else {
        emit(TodoOverviewCubitLoadedState(collections: collections.right));
      }
    } on Exception {
      emit(TodoOverviewCubitErrorState());
    }
  }
}
