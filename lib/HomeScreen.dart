import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, String> data = {
    'Name': '',
    'Number': '',
  };
  Map<String, dynamic> getStoreDta ={};
  Future insertData(data) async {
    print(data);
    SharedPreferences pref = await SharedPreferences.getInstance();
    
    pref.setString('storage', json.encode(data));
    print('data inserted');

  }

  Future getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    
    final storeData = await json.decode(pref.getString('storage'));
    setState(() {
       final getStoreData= storeData;
      print(getStoreData);
    });
    
  }

  Future removeData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Shared Prefernces",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                onChanged: (String value) {
                  data['Name'] = value;
                },
                decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter Name",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  data['Number'] = value;
                },
                decoration: InputDecoration(
                    hintText: "Enter Number",
                    labelText: "Number",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    suffixIcon: Icon(Icons.phone)),
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      child: Text("Submit"),
                      onPressed: () {
                        insertData(data);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        fixedSize: Size(100, 38),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        primary: Colors.grey,
                        onPrimary: Colors.black87,
                        elevation: 5,
                        shadowColor: Colors.grey,
                        side: BorderSide(color: Colors.black12, width: 1.5),
                      ),
                    ),
                    ElevatedButton(
                      child: Text("Get"),
                      onPressed: () {
                        getData();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        fixedSize: Size(100, 38),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        primary: Colors.grey,
                        onPrimary: Colors.black87,
                        elevation: 5,
                        shadowColor: Colors.grey,
                        side: BorderSide(color: Colors.black12, width: 1.5),
                      ),
                    ),
                    ElevatedButton(
                      child: Text("Remove"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        fixedSize: Size(100, 38),
                        textStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                        primary: Colors.grey,
                        onPrimary: Colors.black87,
                        elevation: 5,
                        shadowColor: Colors.grey,
                        side: BorderSide(color: Colors.black12, width: 1.5),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Show Name: ",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Show Number: ",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
