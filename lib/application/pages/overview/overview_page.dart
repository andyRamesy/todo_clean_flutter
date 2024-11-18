import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/application/core/page_config.dart';
import 'package:todo_clean/application/pages/overview/bloc/todo_overview_cubit.dart';
import 'package:todo_clean/application/pages/overview/overview_state/todo_overview_error.dart';
import 'package:todo_clean/application/pages/overview/overview_state/todo_overview_loaded.dart';
import 'package:todo_clean/application/pages/overview/overview_state/todo_overview_loading.dart';
import 'package:todo_clean/domain/use_cases/load_todo_collections.dart';

class OverviewPageProvider extends StatelessWidget {
  const OverviewPageProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoOverviewCubit(
          loadTodoCollection: LoadTodoCollection(
              todoRepository: RepositoryProvider.of(context)))
        ..readTodoCollection(),
      child: const OverviewPage(),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  static const pageConfig = PageConfig(
    icon: Icons.voice_over_off,
    name: 'overview',
    child: OverviewPageProvider(),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.tealAccent,
      child: BlocBuilder<TodoOverviewCubit, TodoOverviewCubitState>(
        builder: (context, state) {
          if (state is TodoOverviewCubitLoadingState) {
            return const TodoOverviewLoading();
          } else if (state is TodoOverviewCubitLoadedState) {
            return TodoOverviewLoaded(collections: state.collections);
          } else {
            return const TodoOverviewError();
          }
        },
      ),
    );
  }
}
