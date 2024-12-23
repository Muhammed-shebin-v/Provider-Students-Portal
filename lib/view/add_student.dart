import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:provider_stdnt_mngmnt/controls/provider.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  String? _name;
  int? _age;
  String? _batch;
  int? _year;
  int? _roll;

  AddStudent({super.key});

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
                decoration: const InputDecoration(hintText: 'Name'),
                onSaved: (value) => _name = value,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3 || num.tryParse(value) != null) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Age'),
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _age = int.tryParse(value ?? ''),
                      validator: (value) {
                        if (value == null || int.tryParse(value) == null || value.length <= 2 ) {
                          return 'Please enter a valid age';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(hintText: 'Roll no'),
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _roll = int.tryParse(value ?? ''),
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
                      decoration: const InputDecoration(hintText: 'Batch'),
                      onSaved: (value) => _batch = value,
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
                      decoration: const InputDecoration(hintText: 'Year'),
                      keyboardType: TextInputType.number,
                      onSaved: (value) => _year = int.tryParse(value ?? ''),
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
                          .addStudent(_name!, _age!, _roll!, _batch!, _year!);
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
