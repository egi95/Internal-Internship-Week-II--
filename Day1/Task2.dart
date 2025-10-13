// File: task2.dart
// Autori: Dardi Braha
// Përshkrimi: Program që ndan numrat në lista të veçanta për çift dhe tek.

Map<String, List<int>> ndaj(List<int> nums) {
  // Krijojmë dy lista bosh për çift dhe tek
  List<int> cift = [];
  List<int> tek = [];

  // Kalojmë në çdo numër të listës
  for (int n in nums) {
    if (n % 2 == 0) {
      // Nëse numri pjesëtohet me 2, është çift
      cift.add(n);
    } else {
      // Përndryshe është tek
      tek.add(n);
    }
  }

  // Kthejmë një Map me dy çelësa: 'cift' dhe 'tek'
  return {
    'cift': cift,
    'tek': tek,
  };
}

void main() {
  // Shembuj testimi
  List<int> nums1 = [1, 2, 3, 4, 5, 6];
  List<int> nums2 = [];
  List<int> nums3 = [2, 4, 8, 10];
  List<int> nums4 = [1, 3, 5, 7];

  print("Test 1: ${ndaj(nums1)}");
  print("Test 2: ${ndaj(nums2)}");
  print("Test 3: ${ndaj(nums3)}");
  print("Test 4: ${ndaj(nums4)}");
}
