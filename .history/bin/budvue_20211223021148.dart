/* 
Using DartPad (https://dartpad.dartlang.org/dart), write a Dart 
program that prints each number from 1 to 100 on a new line. 
For each multiple of 3, print "Bud" instead of the number. For each multiple of 5, 
print "Vue" instead of the number. For numbers which are multiples of both 3 and 5, print 
"Budvue should consider $yourName for this position" instead of the number.
Example:
 
  [1,2,3,4,5,6...100]   
  
  (3 % 3 = 0)  = "Bud" 
  (5 % 5 = 0 ) = "Vue"
  ((30 % 3) && (30 % 5)) = "Budvue should consider $Adalberto for this position"
 */

import 'dart:isolate';

///Extention method for Int class to add multiple method
extension _AdalbertoExtForBudvue on int {
  ///Check for the multiple of a number, where `multiple` variable is the multiple. Returns a bolean.
  /// ```dart
  /// 3.isMultipleOf(3) = true
  /// ```

  bool isMultipleOf(int multiple) {
    if (multiple.isNegative) {
      throw Exception('The "multiple" variable need to be a Positive Number');
    }
    return this % multiple == 0;
  }
}

void displayNumberFromOneToHundred(int maxNumber) {
  const name = 'Adalberto';

  for (var i = 1; i <= maxNumber; i++) {
    if (i.isMultipleOf(3) && i.isMultipleOf(5)) {
      print("Budvue should consider $name for this position");
      continue;
    }
    if (i.isMultipleOf(3)) {
      print("But");
      continue;
    }
    if (i.isMultipleOf(5)) {
      print("Vue");
      continue;
    } else {
      print(i);
    }
  }
}

void main(List<String> arguments) {
  
  // Use Isolet to delegate the heavy compute and leave the main isolate free for any render 
  Isolate.spawn(displayNumberFromOneToHundred, 100);
  
}
