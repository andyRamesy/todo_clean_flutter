import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_clean/application/app/basic_app.dart';
import 'package:todo_clean/data/repositories/todo_repository_mock.dart';
import 'package:todo_clean/domain/repositories/todo_repository.dart';

void main() {
  runApp(RepositoryProvider<TodoRepository>(
    create: (context) => TodoRepositoryMock(),
    child: const BasicApp(),
  ));
}
