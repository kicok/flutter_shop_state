import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routhName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What do people call you?',
                  labelText: 'Title',
                ),
                textInputAction: TextInputAction.next,
              )
            ],
          ),
        ),
      ),
    );
  }
}
