import 'package:flutter_test/flutter_test.dart';

void main() {
  var case1 = "put it tup";
  var case2 = "step on no pets";
  var case3 = "kasur rusak";
  var case4 = "suitmedia";

  group("IsPalindrome", () {
    test("Case1", () {
      isPalindrome(true, case1);
    });
    test("Case2", () {
      isPalindrome(true, case2);
    });
    test("Case3", () {
      isPalindrome(true, case3);
    });
    test("Case4", () {
      isPalindrome(false, case4);
    });
  });
}

void isPalindrome(bool expected, String case1) {
  var splitted = case1.split(" ").join("");
  var l = splitted.length ~/ 2;
  var result = true;
  for (int i = 0; i < l; i++) {
    if (splitted[i] != splitted[splitted.length - 1 - i] && i+1 != l)
      result = false;
  }

  expect(expected, result);
}
