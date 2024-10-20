import 'package:flutter/material.dart';

import '../application/bloc/home_bloc.dart';
import 'document_list_screen/document_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visiting Card Scanner',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child:const DocumentListScreen(),
      ),
    );
  }
}
