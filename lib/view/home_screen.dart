import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_stdnt_mngmnt/controls/provider.dart';
import 'package:provider_stdnt_mngmnt/view/add_student.dart';
import 'package:provider_stdnt_mngmnt/view/edit_student.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    final students = studentProvider.students;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 235, 187),
        title: const Text(
          'Provider Student',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 27,
              color: Color.fromARGB(255, 243, 119, 42)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddStudent()));
              },
              icon: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 243, 119, 42),
                size: 35,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Students',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const Gap(20),
            SizedBox(
              height: 500,
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Gap(20),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    return Slidable(
                        key: ValueKey(students[index]),
                        endActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          extentRatio: 0.75,
                          dismissible: DismissiblePane(
                            onDismissed: () {
                              Provider.of<StudentProvider>(context,listen: false).deleteStudent(students[index].id);
                            },
                          ),
                          children: [
                            SlidableAction(
                              borderRadius: BorderRadius.circular(20),
                              onPressed: (_) => {
                                 Provider.of<StudentProvider>(context,listen: false).deleteStudent(students[index].id)
                              },
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        startActionPane: ActionPane(
                          motion: const DrawerMotion(),
                          extentRatio: 0.75,
                          children: [
                            SlidableAction(
                               borderRadius: BorderRadius.circular(20),
                              onPressed: (_) => {
                                 Navigator.push(context, MaterialPageRoute(builder: (context)=> EditStudent(student: students[index])))
                              },
                              backgroundColor: Colors.blue,
                              icon: Icons.edit,
                              label: 'Update',
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 185, 235, 187),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Student Name : ${students[index].name}'),
                                Row(
                                  children: [
                                    Text('Age : ${students[index].age}'),
                                    const Gap(50),
                                    Text('Sex : ${students[index].roll}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Batch : ${students[index].batch}'),
                                    const Gap(30),
                                    Text('Year : ${students[index].year}'),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
