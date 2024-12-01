import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/application/core/page_config.dart';
import 'package:todo_clean/application/pages/detail/bloc/cubit/todo_detail_cubit.dart';
import 'package:todo_clean/application/pages/detail/view_states/todo_detail_error.dart';
import 'package:todo_clean/application/pages/detail/view_states/todo_detail_loaded.dart';
import 'package:todo_clean/application/pages/detail/view_states/todo_detail_loading.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';
import 'package:todo_clean/domain/use_cases/load_todo_entry_ids_for_collections.dart';

class TodoDetailPageProvider extends StatelessWidget {
  final CollectionId collectionId;

  const TodoDetailPageProvider({super.key, required this.collectionId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoDetailCubit>(
      create: (context) => TodoDetailCubit(
        collectionId: collectionId,
        loadTodoEntryIdsForCollections: LoadTodoEntryIdsForCollections(
            todoRepository: RepositoryProvider.of<TodoRepository>(context)),
      )..fetch(),
      child: TodoDetailPage(
        collectionId: collectionId,
      ),
    );
  }
}

class TodoDetailPage extends StatelessWidget {
  final CollectionId collectionId;
  const TodoDetailPage({super.key, required this.collectionId});

  static const PageConfig pageConfig = PageConfig(
      icon: Icons.work_history_rounded, name: 'detail', child: Placeholder());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoDetailCubit, TodoDetailCubitState>(
      builder: (context, state) {
        if (state is TodoDetailCubitLoadingState) {
          return const TodoDetailLoading();
        } else if (state is TodoDetailCubitLoadedState) {
          return TodoDetailLoaded(
            entryIds: state.entryIds,
            collectionId: collectionId,
          );
        } else {
          return const TodoDetailError();
        }
      },
    );
  }
}
