import 'package:flutter/material.dart';

class CardDetailScreen extends StatelessWidget {
  final int id;

  const CardDetailScreen({this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('$id'),
      ),
    );
  }
}
