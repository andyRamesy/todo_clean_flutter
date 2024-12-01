import 'package:either_dart/either.dart';
import 'package:todo_clean/domain/entities/todo_collection.dart';
import 'package:todo_clean/domain/entities/todo_entry.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/failures/failures.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoCollection>>> readTodoCollection();
  Future<Either<Failure, TodoEntry>> readTodoEntry(
    CollectionId collectionId,
    EntryId entryId,
  );
  Future<Either<Failure, List<EntryId>>> readTodoEntryIds(
      CollectionId collectionId);
  Future<Either<Failure, TodoEntry>> updateTodoEntry(
      {required CollectionId collectionId, required EntryId entryId});
}
