import 'package:flutter/material.dart';
import 'package:society_app/visitors/visitor_card.dart';

class VisitorScreen extends StatelessWidget {
  const VisitorScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Visitors'),
      ),
      body: const VisitorCard(),
    );
  }
}