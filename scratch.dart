import 'dart:io';


void main() {
  performTasks();
}

void performTasks() async{
  task1();
  String task2Result =  await task2();
  task3(task2Result);
}

void task1() {
  String result = 'task1 data';
  print('task 1 completed');
}


Future<String> task2() async{
  String result = '';
  Duration threeSeconds = Duration(seconds: 3);
  await  Future.delayed(threeSeconds, (){
    result = 'task2 data';
    print('task 2 completed');
  });
  return result;
}



void task3(String task2Data) {
  String result = 'task3 data';
  print('task 3 completed with $task2Data');
}

