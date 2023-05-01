String getCalories(double? calories) {
  if (calories == null) {
    return '0 KAL';
  } else {
    return '${calories.floor()} KAL';
  }
}

String getWeight(double? weight) {
  if (weight == null) {
    return '0';
  } else {
    return '${weight.floor()}';
  }
}
