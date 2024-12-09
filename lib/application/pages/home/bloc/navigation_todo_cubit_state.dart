part of 'navigation_todo_cubit.dart';

class NavigationToDoCubitState extends Equatable {
  final CollectionId? selectedCollectionId;
  final bool? secondBodyIsDisplayed;

  const NavigationToDoCubitState({
    this.secondBodyIsDisplayed,
    this.selectedCollectionId,
  });

  @override
  List<Object?> get props => [secondBodyIsDisplayed, selectedCollectionId];
}
