void main() {
  
  List<int> nums = [1, 2, 3, 4, 5, 6];

 
  Map<String, List<int>> rezultat = ndaj(nums);

  
  print('cift: ${rezultat['cift']}');
  print('tek: ${rezultat['tek']}');
}

Map<String, List<int>> ndaj(List<int> nums) {
  
  List<int> ciftList = [];
  List<int> tekList = [];

 
  for (int n in nums) {
    if (n % 2 == 0) {
      ciftList.add(n);
    } else {
      tekList.add(n);
    }
  }

  
  return {
    'cift': ciftList,
    'tek': tekList,
  };
}
