import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  final String TaskName;
  final bool isDOne;
  Function(bool?)? onchanged;
 Function(BuildContext)? deleteTask;


  TodoList(
      {super.key,
      required this.TaskName,
      required this.isDOne,
      required this.deleteTask,
      
      this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),


            ],
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
             
              children: [
                Checkbox(
                    activeColor: Colors.black54,
                    value: isDOne,
                    onChanged: onchanged),
                Text(
                  TaskName,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: isDOne ? FontWeight.w300 : null,
                      decoration: isDOne ? TextDecoration.lineThrough : null),
                ),
  
                
              ],
            ),
          ),
        ),
      ),
    );
  }
  

}
