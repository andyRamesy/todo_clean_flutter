import 'package:either_dart/either.dart';
import 'package:todo_clean/core/use_case.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/failures/failures.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class LoadTodoEntryIdsForCollections implements UseCase<List<EntryId>, CollectionIdParam>{
  final TodoRepository todoRepository;

  const LoadTodoEntryIdsForCollections({
    required this.todoRepository
  });
 
  @override
  Future<Either<Failure, List<EntryId>>> call(CollectionIdParam params) async {
    try {
      final loadedIds = todoRepository.readTodoEntryIds(
        params.collectionId
      );
      return loadedIds.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
  
}