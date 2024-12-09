import 'package:either_dart/either.dart';
import 'package:todo_clean/domain/entities/todo_collection.dart';
import 'package:todo_clean/domain/entities/todo_color.dart';
import 'package:todo_clean/domain/entities/todo_entry.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/failures/failures.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

class TodoRepositoryMock implements TodoRepository {
  final List<TodoEntry> todoEntries = List.generate(
      10,
      (index) => TodoEntry(
          description: 'description $index',
          isDone: false,
          id: EntryId.fromUniqueString(index.toString())));

  final todoCollections = List<TodoCollection>.generate(
      10,
      (index) => TodoCollection(
          id: CollectionId.fromUniqueString(index.toString()),
          title: 'title $index',
          color: TodoColor(
              colorIndex: index % TodoColor.predefinedColors.length)));

  @override
  Future<Either<Failure, List<TodoCollection>>> readTodoCollection() {
    try {
      return Future.delayed(
        const Duration(milliseconds: 200),
        () => Right(todoCollections),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readTodoEntryIds(
      CollectionId collectionId) {
    try {
      int startIndex = 0;
      final endIndex = startIndex + 10;
      final entryIds = todoEntries
          .sublist(startIndex, endIndex)
          .map((entry) => entry.id)
          .toList();
      return Future.delayed(
          const Duration(milliseconds: 300), () => Right(entryIds));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, TodoEntry>> readTodoEntry(
      CollectionId collectionId, EntryId entryId) {
    try {
      final selectedEntryItem = todoEntries.firstWhere(
        (element) => element.id == entryId,
      );
      return Future.delayed(
        const Duration(milliseconds: 200),
        () => Right(selectedEntryItem),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
  
  @override
  Future<Either<Failure, TodoEntry>> updateTodoEntry({required CollectionId collectionId, required EntryId entryId}) {
    final index = todoEntries.indexWhere((element) => element.id == entryId);
    final entryToUpdate = todoEntries[index];
    final updatedEntry = todoEntries[index].copyWith(isDone: !entryToUpdate.isDone);
    todoEntries[index] = updatedEntry;
    return Future.delayed(const Duration(milliseconds: 100), () => Right(updatedEntry));
  }

  
  

}
