class ApiRecipes {
  String query;
  int from;
  int to;
  bool more;
  int count;
  List<APIHits> hits;

  ApiRecipes({
    required this.query,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits,
  });

  factory ApiRecipes.fromJson(Map<String, dynamic> json) => ApiRecipes(
        query: '',
        from: json['from'],
        to: json['to'],
        count: json['count'],
        hits: json['hits'],
        more: json['more'],
      );

  Map<String, dynamic> toJson() => {
        'query': query,
        'from': from,
        'to': to,
        'more': more,
        'count': count,
        'hits': hits,
      };
}

class APIHits {
  Recipe recipes;
  APIHits({
    required this.recipes,
  });

  factory APIHits.fromJson(Map<String, dynamic> json) => APIHits(
        recipes: json['recipes'],
      );

  Map<String, dynamic> toJson() => {
        'recipes': recipes,
      };
}

class Recipe {
  String label;
  String image;
  String url;
  List<APIIngredients> ingredients;
  double calories;
  double totalWeight;
  double totalTime;

  Recipe({
    required this.label,
    required this.image,
    required this.url,
    required this.ingredients,
    required this.calories,
    required this.totalWeight,
    required this.totalTime,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        label: json['label'],
        image: json['image'],
        url: json['url'],
        ingredients: json['ingredients'],
        calories: json['calories'],
        totalWeight: json['totalWeight'],
        totalTime: json['totalTime'],
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'image': image,
        'url': url,
        'ingredients': ingredients,
        'calories': calories,
        'totalWeight': totalWeight,
        'totalTime': totalTime,
      };
}

class APIIngredients {
  String name;
  double weight;
  APIIngredients({
    required this.name,
    required this.weight,
  });

  factory APIIngredients.fromJson(Map<String, dynamic> json) => APIIngredients(
        name: json['name'],
        weight: json['weight'],
      );
  Map<String, dynamic> toJson() => {
        'name': name,
        'weight': weight,
      };
}
