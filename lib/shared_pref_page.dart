import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefPage extends StatefulWidget {
  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {
  String _name;
  int _age;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          
    );
  }
}
