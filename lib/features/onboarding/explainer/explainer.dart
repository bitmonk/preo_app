import 'package:flutter/material.dart';

class Explainer extends StatefulWidget {
  const Explainer({super.key});

  @override
  State<Explainer> createState() => _ExplainerState();
}

class _ExplainerState extends State<Explainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}
