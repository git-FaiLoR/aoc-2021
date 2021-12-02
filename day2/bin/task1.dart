import 'dart:io';

void main () {
  var input = readFileToList();

  calculateResult(input);
}

List<int> readFileToList () {
  var inputList = <int>[0, 0];
  File inputFile = File('./data/input.txt');

  inputFile.readAsLinesSync().forEach((element) {
    if(element.split(" ")[0] == "forward") {
      inputList[0] = inputList[0] + int.parse(element.split(" ")[1]);
    }
    else if(element.split(" ")[0] == "down"){
      inputList[1] = inputList[1] + int.parse(element.split(" ")[1]);
    }
    else if(element.split(" ")[0] == "up"){
      inputList[1] = inputList[1] - int.parse(element.split(" ")[1]);
    }
  });

  return inputList;
}

void calculateResult (List<int> list) {
  print(list[0] * list[1]);
}