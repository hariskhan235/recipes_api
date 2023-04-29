import '../../app/imports.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit()
      : super(
          RecipeInitial(),
        );

  Random firstrandom = Random();
  Random secondRandom = Random();

  NetworkService recipeService = NetworkService();

  Future<dynamic> getRecipes(String query, int from, int to) async {
    try {
      emit(RecipeLoading());
      await recipeService
          .getRecipes(
        query,
        firstrandom.nextInt(10),
        secondRandom.nextInt(20),
      )
          .then((recipes) {
        //print(recipes);
        emit(
          RecipeLoaded(recipes: recipes),
        );
      });
    } on HttpException catch (e) {
      emit(RecipeError(message: e.toString()));
      return Future.error(e.toString());
    } on SocketException catch (e) {
      emit(RecipeError(message: e.toString()));
      return Future.error(e.toString());
    } on TimeoutException catch (e) {
      emit(RecipeError(message: e.toString()));
      return Future.error(e.toString());
    } catch (e) {
      emit(RecipeError(message: e.toString()));
      return Future.error(e.toString());
    }
  }
}
