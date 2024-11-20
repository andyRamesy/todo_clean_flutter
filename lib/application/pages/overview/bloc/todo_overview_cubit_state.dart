part of 'todo_overview_cubit.dart';

class TodoOverviewCubitState extends Equatable {
  const TodoOverviewCubitState();

  @override
  List<Object> get props => [];
}

class TodoOverviewCubitLoadingState extends TodoOverviewCubitState{
const TodoOverviewCubitLoadingState();
}

class TodoOverviewCubitErrorState extends TodoOverviewCubitState {
  const TodoOverviewCubitErrorState();
}

class TodoOverviewCubitLoadedState extends TodoOverviewCubitState {
  final List<TodoCollection> collections;

  const TodoOverviewCubitLoadedState({
    required this.collections
  });
  
  @override
  List<Object> get props => [collections];
}
