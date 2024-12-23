import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_stdnt_mngmnt/controls/provider.dart';
import 'package:provider_stdnt_mngmnt/model/student_model.dart';

// ignore: must_be_immutable
class EditStudent extends StatelessWidget {
  final StudentModel student;
  EditStudent({super.key,required this.student});
  final _formkey=GlobalKey<FormState>();
  late String _name = student.name;
  late int _age = student.age;
  late String _batch = student.batch;
  late int _year = student.year;
  late int _roll = student.roll;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: const InputDecoration(hintText: 'Name'),
                onSaved: (value) => _name = value!,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _age.toString(),
                      decoration: const InputDecoration(hintText: 'Age'),
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _age = int.tryParse(value!)??0,
                      validator: (value) {
                        if (value == null || int.tryParse(value) == null) {
                          return 'Please enter a valid age';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: TextFormField(
                      initialValue: _roll.toString(),
                      decoration: const InputDecoration(hintText: 'Roll no'),
                      onSaved: (value) => _roll = int.tryParse(value!) ?? 0,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a batch';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue:_batch ,
                      decoration: const InputDecoration(hintText: 'Batch'),
                      onSaved: (value) => _batch = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a batch';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: TextFormField(
                      initialValue: _year.toString(),
                      decoration: const InputDecoration(hintText: 'Year'),
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _year = int.tryParse(value!)??0,
                      validator: (value) {
                        if (value == null || int.tryParse(value) == null) {
                          return 'Please enter a valid year';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Gap(50),
              IconButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      Provider.of<StudentProvider>(context, listen: false)
                          .updateStudent(student.id,_name, _age, _roll, _batch, _year,);
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}