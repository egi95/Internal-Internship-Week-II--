Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (int n in nums) {
    if (n % 2 == 0) {
      cift.add(n);
    } else {
      tek.add(n);
    }
  }

  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  print(ndaj([1, 2, 3, 4, 5, 6]));
  print(ndaj([]));
  print(ndaj([2, 4, 8]));
  print(ndaj([1, 3, 5]));
}
