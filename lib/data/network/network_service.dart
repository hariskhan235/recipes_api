import 'package:recipes_api/models/recipe_model.dart';

import '../../app/imports.dart';

const String apiKey = '1332be7fa8c5cb74135d8142f827bcf7';
const String apiId = '1f63ee74';
const String appUrl = 'https://api.edamam.com/search';

class NetworkService {
  Future getData(String url) async {
    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      return Future.error(
        response.body.toString(),
      );
    }
  }

  Future<dynamic> getRecipes(String query, int from, int to) async {
    final recipeData = await getData(
        '$appUrl?app_id=$apiId&app_key=$apiKey&q=$query&from=$from&to=$to');
    return recipeData;
  }
}
