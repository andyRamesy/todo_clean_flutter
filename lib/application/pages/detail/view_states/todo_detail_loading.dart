import 'package:flutter/material.dart';

class TodoDetailLoading extends StatelessWidget {
  const TodoDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
