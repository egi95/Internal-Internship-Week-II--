void main() {
  List<int> nums1 = [1, 2, 3, 4, 5, 6];
  List<int> nums2 = [];
  List<int> nums3 = [1, 3, 5];
  List<int> nums4 = [2, 4, 8, 10];

  print('Test 1: ${ndaj(nums1)}');
  print('Test 2: ${ndaj(nums2)}');
  print('Test 3: ${ndaj(nums3)}');
  print('Test 4: ${ndaj(nums4)}');
}

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cifta = [];
  List<int> teka = [];

  for (int n in nums) {
    if (n % 2 == 0) {
      // nëse pjesa me 2 është 0, numri është çift
      cifta.add(n);
    } else {
      // përndryshe është tek
      teka.add(n);
    }
  }

  // Kthejmë një hartë (Map) me të dy listat
  return {
    'cift': cifta,
    'tek': teka,
  };
}
