import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/buttons/my_raised_button.dart';
class SharedPrefPage extends StatefulWidget {
  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {
  String _name;
  int _age;
  SharedPreferences mySharedPreference;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey= new GlobalKey<ScaffoldState>();
  final double textFieldPadding = 10;
  final double borderRadius = 10;


  @override
  void initState() {
    super.initState();
    getSharedPreference();
  }

  void getSharedPreference() async{
    mySharedPreference= await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(title: Text("Shared Preferences Usage"),),
        body: Column(
            children: <Widget>[Spacer(flex: 2,),
              nameTextField(),
              Spacer(),
              ageTextField(),
              Spacer(),
              buttonsRow(),
              Spacer(flex: 10,)
            ],
          ),
    );
  }
  Padding nameTextField(){
    return Padding(
      padding: EdgeInsets.all(textFieldPadding),
      child: TextFormField(
        controller: _nameController,
        decoration: InputDecoration(
          labelText: "Enter your name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }

  Padding ageTextField(){
    return Padding(
      padding: EdgeInsets.all(textFieldPadding),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(),
        controller: _ageController,
        decoration: InputDecoration(
          labelText: "Enter your age",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }

  Row buttonsRow() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ShapedRaisedButton(onPressed: _addInfo,color: Colors.green,buttonText: "Add info",),
                ShapedRaisedButton(onPressed: _getInfo,color: Colors.blue,buttonText:"Show Info",),
                ShapedRaisedButton(onPressed: _deleteInfo,color: Colors.red,buttonText:"remove info",),
              ],
            );
  }

  void _addInfo() async{
    await mySharedPreference.setString("name", _nameController.text);
    await mySharedPreference.setInt("age", int.parse(_ageController.text));
  }

  void _getInfo() {
    _name = mySharedPreference.getString("name");
    _age = mySharedPreference.getInt("age");
    _scaffoldkey.currentState.showSnackBar(SnackBar(
      backgroundColor: Colors.blue,
      content: Text("Name: $_name\nAge: $_age"),
    ));

  }

  void _deleteInfo(){
    mySharedPreference.remove("name");
    mySharedPreference.remove("age");
  }
}
