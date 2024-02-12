import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_pref_sample/ui_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSample extends StatefulWidget {
  const SharedPrefSample({super.key});

  @override
  State<SharedPrefSample> createState() => _SharedPrefSampleState();
}

class _SharedPrefSampleState extends State<SharedPrefSample> {
  var nameController = TextEditingController();
  String? name;

  getName() async{
    var prefs = await SharedPreferences.getInstance();
    name = prefs.getString("Name");
    setState(() {

    });
  }

  addName(String Name) async{
    if(Name==""){

    }else{
      var prefs = await SharedPreferences.getInstance();
      prefs.setString("Name", nameController.text.toString());
      setState(() {
        name = nameController.text.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Pref Sample"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.CustomTextField(nameController, "Enter Name", false, Icons.person),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () async{
            addName(nameController.text.toString());
          }, child: Text("Save Data")),
          SizedBox(height: 30,),
          Text("${name??"First Time"}")
        ],
      )
    );
  }
}
