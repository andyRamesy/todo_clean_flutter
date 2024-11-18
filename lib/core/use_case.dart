import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_clean/domain/entities/unique_id.dart';
import 'package:todo_clean/domain/failures/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class Params extends Equatable {}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}

class TodoEntryIdParam extends Params {
  final EntryId entryId;
  final CollectionId collectionId;

  TodoEntryIdParam({
    required this.collectionId,
    required this.entryId,
  }) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [collectionId, entryId];
}

class CollectionIdParam extends Params {
  final EntryId entryId;
  final CollectionId collectionId;

  CollectionIdParam({
    required this.collectionId,
    required this.entryId,
  }) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [collectionId, entryId];
}