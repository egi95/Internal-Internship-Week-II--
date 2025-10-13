// task2.dart
import 'dart:io';

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (var num in nums) {
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
  // Shembull testimi
  List<int> nums = [1, 2, 3, 4, 5, 6];
  var rezultat = ndaj(nums);

  print("cift: ${rezultat['cift']}");
  print("tek: ${rezultat['tek']}");

  // Testime shtesë
  List<int> bosh = [];
  print("\nLista bosh:");
  print(ndarjaNeString(bosh));

  List<int> vetemCift = [2, 4, 8, 10];
  print("\nVetëm çift:");
  print(ndarjaNeString(vetemCift));

  List<int> vetemTek = [1, 3, 5, 7];
  print("\nVetëm tek:");
  print(ndarjaNeString(vetemTek));
}

String ndarjaNeString(List<int> nums) {
  var rezultat = ndaj(nums);
  return "cift: ${rezultat['cift']} | tek: ${rezultat['tek']}";
}
