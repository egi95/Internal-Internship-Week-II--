void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  Map<String, List<int>> rezultat = ndaj(nums);

  print("Cift: ${rezultat['cift']}");
  print("Tek: ${rezultat['tek']}");
}

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (int num in nums) {
    if (num % 2 == 0) {
      cift.add(num); 
    } else {
      tek.add(num); 
    }
  }
  return {
    'cift': cift,
    'tek': tek,
  };
}
