Map<String, List<int>> numbers(List<int> numbers) {
  List<int> even = [];
  List<int> odd = [];

  for (var number in numbers) {
    if (number % 2 == 0) {
      even.add(number);
    } else {
      odd.add(number);
    }
  }

  return {'even': evens, 'odd': odd};
}

void main() {
  var result = numbers([1, 2, 3, 4, 5, 6]);
  print('even: ${result['even']}, odd: ${result['odd']}');
}
