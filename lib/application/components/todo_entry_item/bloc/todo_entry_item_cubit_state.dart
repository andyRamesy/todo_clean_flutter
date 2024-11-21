

part of 'todo_entry_item_cubit.dart';


abstract class TodoEntryItemState extends Equatable{

  const TodoEntryItemState();

  @override
  List<Object?> get props => [];
}

class ToDoEntryItemLoadingState extends TodoEntryItemState{}
class ToDoEntryItemErrorState extends TodoEntryItemState{}
class ToDoEntryItemLoadedState extends TodoEntryItemState{

  final TodoEntry toDoEntry;

  const ToDoEntryItemLoadedState({required this.toDoEntry});
}