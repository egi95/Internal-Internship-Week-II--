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
  return {'cift': cift, 'tek': tek};
}

void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  Map<String, List<int>> rezultat = ndaj(nums);
  print('cift: ${rezultat['cift']}');
  print('tek: ${rezultat['tek']}');


  List<int> bosh = [];
  print(ndaj(bosh));
  
  List<int> vetemCift = [2, 4, 6];
  print(ndaj(vetemCift));

 
  List<int> vetemTek = [1, 3, 5];
  print(ndaj(vetemTek));
}
