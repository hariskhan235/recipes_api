String getCalories(double? calories) {
  if (calories == null) {
    return '0 KAL';
  } else {
    return '${calories.floor()}';
  }
}

String getWeight(double? weight) {
  if (weight == null) {
    return '0 KAL';
  } else {
    return '${weight.floor()}';
  }
}
