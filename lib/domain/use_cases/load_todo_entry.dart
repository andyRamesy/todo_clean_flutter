import 'package:either_dart/either.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/todo_entry.dart';
import 'package:todo_clean/domain/failures/failures.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class LoadTodoEntry implements UseCase<TodoEntry, TodoEntryIdParam> {
  final TodoRepository todoRepository;
  const LoadTodoEntry({required this.todoRepository});

  @override
  Future<Either<Failure, TodoEntry>> call(TodoEntryIdParam params) async {
    try {
      final loadedEntry =
         await todoRepository.readTodoEntry(params.collectionId, params.entryId!);
      return loadedEntry.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
