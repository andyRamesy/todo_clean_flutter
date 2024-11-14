import 'package:either_dart/either.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/todo_collection.dart';
import 'package:todo_clean/domain/failures/failures.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class LoadTodoCollection implements UseCase<List<TodoCollection>, NoParams> {
  final TodoRepository todoRepository;
  const LoadTodoCollection({required this.todoRepository});

  @override
  Future<Either<Failure, List<TodoCollection>>> call(NoParams params) async {
    try {
      final loadCollection = todoRepository.readTodoCollection();
      return loadCollection.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
