import 'package:flutter/material.dart';

class CatalogName extends StatelessWidget {
  final String name;
  const CatalogName({this.name = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        name,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
