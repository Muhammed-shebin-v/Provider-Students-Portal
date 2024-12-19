import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_stdnt_mngmnt/control/provider.dart';
import 'package:provider_stdnt_mngmnt/view/add_student.dart';
import 'package:provider_stdnt_mngmnt/view/home_screen.dart';

void main(){
  runApp(const ProviderStudentManagment());
}
class ProviderStudentManagment extends StatelessWidget {
  const ProviderStudentManagment({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => StudentProvider(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Provider student managment',
      home:HomeScreen (),
    )
    );
  }
}