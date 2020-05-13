import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit product'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Title'),
              textInputAction: TextInputAction.newline,
            )
          ],
        ),),
      ),
    );
  }
}

