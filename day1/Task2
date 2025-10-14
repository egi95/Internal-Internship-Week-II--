// File: task2.dart

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

void main() {
  // Example usage
  List<int> numbers = [1, 2, 3, 4, 5, 6];

  Map<String, List<int>> ndarja = ndaj(numbers);

  print('Cift: ${ndarja['cift']}');
  print('Tek: ${ndarja['tek']}');

  // Test with empty list
  List<int> bosh = [];
  Map<String, List<int>> ndarjaBosh = ndaj(bosh);
  print('Cift (empty): ${ndarjaBosh['cift']}');
  print('Tek (empty): ${ndarjaBosh['tek']}');

  // Test with only even numbers
  List<int> vetemCift = [2, 4, 6];
  Map<String, List<int>> ndarjaCift = ndaj(vetemCift);
  print('Cift: ${ndarjaCift['cift']}');
  print('Tek: ${ndarjaCift['tek']}');

  // Test with only odd numbers
  List<int> vetemTek = [1, 3, 5];
  Map<String, List<int>> ndarjaTek = ndaj(vetemTek);
  print('Cift: ${ndarjaTek['cift']}');
  print('Tek: ${ndarjaTek['tek']}');
}
