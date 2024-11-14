import 'package:either_dart/either.dart';
import 'package:todo_clean/domain/entities/todo_collection.dart';
import 'package:todo_clean/domain/entities/todo_color.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/failures/failures.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class TodoRepositoryMock implements TodoRepository {
  @override
  Future<Either<Failure, List<TodoCollection>>> readTodoCollection() {

    final list = List<TodoCollection>.generate(
        10,
        (index) => TodoCollection(
            id: CollectionId.fromUniqueString(index.toString()),
            title: 'title $index',
            color: TodoColor(colorIndex: index % TodoColor.predefinedColors.length)));

            return Future.delayed(const Duration(microseconds: 200),()=> Right(list));
  }
}
