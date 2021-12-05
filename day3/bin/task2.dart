import 'dart:io';

void main() {
  var input = readFileToList();

  calculateResult(input);
}

List<int> co2Count(List input, int count) {
  var result = List<int>.empty(growable: true);

  if(input.length > 1) {
    int countOnes = 0;
    int countZeroes = 0;
    var newInput = List.empty(growable: true);

    for (var j = 0; j < input.length; j++) {
      if (input[j][count] == "1") {
        countOnes++;
      }
      else {
        countZeroes++;
      }
    }

    if (countOnes < countZeroes) {
      for (var j = 0; j < input.length; j++) {
        if (input[j][count] == "1") {
          newInput.add(input[j]);
        }
      }
    }
    else {
      for (var j = 0; j < input.length; j++) {
        if (input[j][count] == "0") {
          newInput.add(input[j]);
        }
      }
    }
    result = co2Count(newInput, (count + 1));
  }
  else if (input.length == 1){
    for(var i = 0; i < 12; i++){
      result.add(int.parse(input[0][i]));
    }
  }

  return result;
}

List<int> o2Count(List input, int count) {
  var result = List<int>.empty(growable: true);

  if(input.length > 1) {
    int countOnes = 0;
    int countZeroes = 0;
    var newInput = List.empty(growable: true);

    for (var j = 0; j < input.length; j++) {
      if (input[j][count] == "1") {
        countOnes++;
      }
      else {
        countZeroes++;
      }
    }

    if (countOnes >= countZeroes) {
      for (var j = 0; j < input.length; j++) {
        if (input[j][count] == "1") {
          newInput.add(input[j]);
        }
      }
    }
    else {
      for (var j = 0; j < input.length; j++) {
        if (input[j][count] == "0") {
          newInput.add(input[j]);
        }
      }
    }
    result = o2Count(newInput, (count + 1));
  }
  else if(input.length == 1){
    for(var i = 0; i < 12; i++){
      result.add(int.parse(input[0][i]));
    }
  }

  return result;
}

void calculateResult(List input) {
  var o2Rate = o2Count(input, 0);
  var co2Rate = co2Count(input, 0);


  print((int.parse(o2Rate.join(), radix: 2)) * (int.parse(co2Rate.join(), radix: 2)));
}

List readFileToList() {
  var inputList = List.empty(growable: true);
  File inputFile = File('./data/input.txt');

  inputFile.readAsLinesSync().forEach((element) {
    inputList.add(element);
  });

  return inputList;
}
