import 'dart:io';

void main() {
  var input = readFileToList();

  calculateResult(input);
}

void calculateResult(List input) {
  var gamma = List<int>.empty(growable: true);
  var delta = List<int>.empty(growable: true);

  for(var i = 0; i < 12; i++) {
    int counter = 0;

    for(var j = 0; j < input.length; j++) {
      if (input[j][i] == "1") {
        counter++;
      }
    }

    if(counter >= 501) {
      gamma.add(1);
      delta.add(0);
    } else {
      gamma.add(0);
      delta.add(1);
    }
  }

  print((int.parse(gamma.join(), radix: 2)) * (int.parse(delta.join(), radix: 2)));
}

List readFileToList() {
  var inputList = List.empty(growable: true);
  File inputFile = File('./data/input.txt');

  inputFile.readAsLinesSync().forEach((element) {
    inputList.add(element);
  });

  return inputList;
}
