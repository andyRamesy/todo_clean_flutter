part of 'todo_detail_cubit.dart';

sealed class TodoDetailCubitState extends Equatable {
  const TodoDetailCubitState();

  @override
  List<Object> get props => [];
}

final class TodoDetailCubitLoadingState extends TodoDetailCubitState {}

final class TodoDetailCubitErrorState extends TodoDetailCubitState {}

final class TodoDetailCubitLoadedState extends TodoDetailCubitState {
  final List<EntryId> entryIds;
  const TodoDetailCubitLoadedState({required this.entryIds});

  @override
  List<Object> get props => [entryIds];
}
