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

  return {'cift': cift, 'tek': tek};
}

void main() {
  stdout.write('Shkruani numrat e ndarë me hapësirë: ');
  List<int> nums = stdin.readLineSync()!
      .split(' ')
      .where((e) => e.isNotEmpty)
      .map(int.parse)
      .toList();

  var rezultati = ndaj(nums);

  print('Numrat çift: ${rezultati['cift']}');
  print('Numrat tek: ${rezultati['tek']}');
}
