import '../../app/imports.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();
  @override
  List<Object?> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeError extends RecipeState {
  final String message;

  const RecipeError({required this.message});
}

class RecipeLoading extends RecipeState {}

class RecipeLoaded extends RecipeState {
  final dynamic recipes;

  const RecipeLoaded({required this.recipes});
}
