import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/application/components/todo_entry_item/bloc/todo_entry_item_cubit.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';
import 'package:todo_clean/domain/use_cases/load_todo_entry.dart';

import 'view_states/todo_entry_item_error.dart';
import 'view_states/todo_entry_item_loaded.dart';
import 'view_states/todo_entry_item_loading.dart';

class TodoEntryItemProvider extends StatelessWidget {
  final CollectionId collectionId;
  final EntryId entryId;

  const TodoEntryItemProvider(
      {super.key, required this.collectionId, required this.entryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoEntryItemCubit>(
      create: (context) => TodoEntryItemCubit(
          entryId: entryId,
          collectionId: collectionId,
          loadTodoEntry: LoadTodoEntry(
              todoRepository: RepositoryProvider.of<TodoRepository>(context)))..fetch(),
      child: const TodoEntryItem(),
    );
  }
}

class TodoEntryItem extends StatelessWidget {
  const TodoEntryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoEntryItemCubit, TodoEntryItemState>(builder:(context, state) {
      if(state is ToDoEntryItemLoadingState){
        return const TodoEntryItemLoading();
      }else if (state is ToDoEntryItemLoadedState){
        return TodoEntryItemLoaded(entryItem: state.toDoEntry,);
      }else {
        return const TodoEntryItemError();
      }
    } ,);
  }
}