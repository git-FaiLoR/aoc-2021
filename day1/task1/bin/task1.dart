import 'dart:io';

void measurementIncreaseCounter(List<int> list) {
  int measurementCounter = 0;

  for (int i=0;i<list.length;i++){
    if (i>0) {
      if (list[i]>list[i-1]) {
        measurementCounter++;
      }
    }
  }

  print(measurementCounter);
}

List<int> readFileToList () {
  var inputList = List<int>.empty(growable: true);
  File inputFile = File('./data/input.txt');

  inputFile.readAsLinesSync().forEach((element) {
    int value = int.parse(element);
    inputList.add(value);
  });

  return inputList;
}

void main(List<String> arguments) {
  List<int> list = readFileToList();

  measurementIncreaseCounter(list);
}


