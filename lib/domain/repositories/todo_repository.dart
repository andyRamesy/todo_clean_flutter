import 'package:either_dart/either.dart';
import 'package:todo_clean/domain/entities/todo_collection.dart';
import 'package:todo_clean/domain/failures/failures.dart';

abstract class TodoRepository{
  Future<Either<Failure,List<TodoCollection>>> readTodoCollection();
}