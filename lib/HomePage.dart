
import 'package:flutter/material.dart';
import 'package:todonofirebase/dailogBox.dart';
import 'TodoList.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final _controller = TextEditingController();

  List TodOList = [
    ['Buy Milk', false],
    ['Buy eggs', false],
    ['Wash all clothes', false],
  ];

  void checkboxState(bool? value, int index) {
    setState(() {
      TodOList[index][1] = !TodOList[index][1];
    });
  }


  void saveNewTask(){
    setState(() {
      TodOList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dailogBox(controller:_controller,
        onSave: saveNewTask,
        onCancel: (){
          Navigator.of(context).pop();
        },
        );
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      TodOList.removeAt(index);
    });

  }

 

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          
          title: const Center(child: Text('TODO')),
          elevation: 0,
        ),

        
        floatingActionButton:  FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            itemCount: TodOList.length,
            itemBuilder: (context, index) {
              return TodoList(
                TaskName: TodOList[index][0],
                isDOne: TodOList[index][1],
                onchanged: (value) => checkboxState(value, index),
                deleteTask: (context) => deleteTask(index),
               
              );
            }));
  }
}
