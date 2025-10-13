task 2-shii

Map<String, List<int>> ndaj(List<int> nums) {
  List<int> cift = [];
  List<int> tek = [];
  
  for (int numri in nums) {
    if (numri % 2 == 0) {
      cift.add(numri);
    } else {
      tek.add(numri);
    }
  }
  
  return {'cift': cift, 'tek': tek};
}

void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  Map<String, List<int>> rezultati = ndaj(nums);
  
  print("cift: ${rezultati['cift']}, tek: ${rezultati['tek']}");
}
