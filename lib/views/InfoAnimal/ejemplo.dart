import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Ejemplo extends StatefulWidget {
  const Ejemplo({super.key});

  @override
  State<Ejemplo> createState() => _EjemploState();
}

class _EjemploState extends State<Ejemplo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
