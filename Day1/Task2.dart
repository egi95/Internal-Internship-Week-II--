import 'dart:io';

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];

  for (var n in nums) {
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
  stdout.write("Shkruaj numrat e ndarë me hapësirë: ");
  String? input = stdin.readLineSync();

  List<int> nums = [];
  if (input != null && input.isNotEmpty) {
    nums = input.split(' ').map((e) => int.parse(e)).toList();
  }

  Map<String, List<int>> rezultat = ndaj(nums);

  print("Numrat çift: ${rezultat['cift']}");
  print("Numrat tek: ${rezultat['tek']}");
}
