class ApiRecipes {
  String? query;
  int? from;
  int? to;
  bool? more;
  int? count;
  List<dynamic> hits;

  ApiRecipes({
    required this.query,
    required this.from,
    required this.to,
    required this.more,
    required this.count,
    required this.hits,
  });

  factory ApiRecipes.fromJson(Map<String, dynamic> json) => ApiRecipes(
        query: json['query'] ?? json['query'],
        from: json['from'] ?? json['from'],
        to: json['to'] ?? json['to'],
        count: json['count'] ?? json['count'],
        hits: json['hits'] ?? json['hits'],
        more: json['more'] ?? json['more'],
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
  Recipe? recipe;
  APIHits({
    required this.recipe,
  });

  factory APIHits.fromJson(Map<String, dynamic> json) => APIHits(
        recipe: json['recipe'] ?? json['recipe'],
      );

  Map<String, dynamic> toJson() => {
        'recipes': recipe,
      };
}

class Recipe {
  String? label;
  String? image;
  String? url;
  List<Ingredients>? ingredients;
  double? calories;
  double? totalWeight;
  double? totalTime;

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
        label: json['label'] ?? json['label'],
        image: json['image'] ?? json['image'],
        url: json['url'] ?? json['url'],
        ingredients: json['ingredients'] ?? json['ingredients'],
        calories: json['calories'] ?? json['calories'],
        totalWeight: json['totalWeight'] ?? json['totalWeight'],
        totalTime: json['totalTime'] ?? json['totalTime'],
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

class Ingredients {
  Ingredients({
    required this.text,
    required this.quantity,
    required this.measure,
    required this.food,
    required this.weight,
    required this.foodCategory,
    required this.foodId,
    required this.image,
  });
  late final String text;
  late final double quantity;
  late final String measure;
  late final String food;
  late final int weight;
  late final String foodCategory;
  late final String foodId;
  late final String image;

  Ingredients.fromJson(Map<String, dynamic> json) {
    text = json['text'] ?? json['text'];
    quantity = json['quantity'] ?? json['quantity'];
    measure = json['measure'] ?? json['measure'];
    food = json['food'] ?? json['food'];
    weight = json['weight'] ?? json['weight'];
    foodCategory = json['foodCategory'] ?? json['foodCategory'];
    foodId = json['foodId'] ?? json['foodId'];
    image = json['image'] ?? json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['quantity'] = quantity;
    data['measure'] = measure;
    data['food'] = food;
    data['weight'] = weight;
    data['foodCategory'] = foodCategory;
    data['foodId'] = foodId;
    data['image'] = image;
    return data;
  }
}
