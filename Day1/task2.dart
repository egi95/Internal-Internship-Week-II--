void main() {
  // Shembuj për testim
  List<int> nums1 = [1, 2, 3, 4, 5, 6];
  List<int> nums2 = [];
  List<int> nums3 = [2, 4, 6];
  List<int> nums4 = [1, 3, 5];

  print(ndaj(nums1)); // prit: {cift: [2, 4, 6], tek: [1, 3, 5]}
  print(ndaj(nums2)); // prit: {cift: [], tek: []}
  print(ndaj(nums3)); // prit: {cift: [2, 4, 6], tek: []}
  print(ndaj(nums4)); // prit: {cift: [], tek: [1, 3, 5]}
}

// Funksioni që ndan numrat
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
