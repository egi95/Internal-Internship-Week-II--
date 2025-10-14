void main() {
  // Test cases
  List<int> nums1 = [1, 2, 3, 4, 5, 6];
  List<int> nums2 = [];
  List<int> nums3 = [1, 3, 5]; // Only odd
  List<int> nums4 = [2, 4, 6]; // Only even

  printResult(nums1);
  printResult(nums2);
  printResult(nums3);
  printResult(nums4);
}

Map<String, List<int>> divide(List<int> nums) {
  List<int> even = [];
  List<int> odd = [];

  for (int num in nums) {
    if (num % 2 == 0) {
      even.add(num);
    } else {
      odd.add(num);
    }
  }

  return {
    'even': even,
    'odd': odd,
  };
}

void printResult(List<int> nums) {
  var result = divide(nums);
  print("Input: $nums");
  print("Even: ${result['even']}");
  print("Odd: ${result['odd']}\n");
}
