import 'package:either_dart/either.dart';
import 'package:either_dart/src/either.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/todo_entry.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/failures/failures.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class UpdateTodoEntry implements UseCase<TodoEntry, TodoEntryIdParam> {
  final TodoRepository todoRepository;

  const UpdateTodoEntry({required this.todoRepository});

  @override
  Future<Either<Failure, TodoEntry>> call(TodoEntryIdParam params) async {
    try {
      final loadedEntry = await todoRepository.updateTodoEntry(
        collectionId: params.collectionId,
        entryId: params.entryId!,
      );
      return loadedEntry.fold((left) => Left(left), (right) => Right(right as TodoEntry));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}