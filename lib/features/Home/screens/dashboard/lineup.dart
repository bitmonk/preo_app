import 'package:flutter/material.dart';

class LineupScreen extends StatefulWidget {
  const LineupScreen({super.key});

  @override
  State<LineupScreen> createState() => _LineupScreenState();
}

class _LineupScreenState extends State<LineupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('LIneurj'),
          ],
        ),
      ),
    );
  }
}
