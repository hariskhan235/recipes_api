import '../../app/imports.dart';

ClipRRect imageWidget(RecipeLoaded state, int index) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0)),
    child: CachedNetworkImage(
      imageUrl: state.recipes['hits'][index]['recipe']['image'].toString(),
      //['recipe']['image'],
    ),
  );
}
