

part of 'todo_entry_item_cubit.dart';


abstract class TodoEntryItemState extends Equatable{

  const TodoEntryItemState();

  @override
  List<Object?> get props => [];
}

class ToDoEntryItemLoadingState extends TodoEntryItemState{
  
}

class ToDoEntryItemErrorState extends TodoEntryItemState{

}

class ToDoEntryItemLoadedState extends TodoEntryItemState{
  const ToDoEntryItemLoadedState({required this.toDoEntry});

  final TodoEntry toDoEntry;

  @override
  List<Object?> get props => [toDoEntry];
}