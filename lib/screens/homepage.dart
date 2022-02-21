import 'package:flutter/material.dart';
import 'package:flutterallapimethod/models/usermodel.dart';
import 'package:flutterallapimethod/services/api_services.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final idcontroller = TextEditingController();

  final firstNamecontroller = TextEditingController();
  final lastcontroller = TextEditingController();

  Usermodel? _usermodel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Apiservices().getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rest Api'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: idcontroller,
            decoration: InputDecoration(hintText: 'id'),
          ),
          TextFormField(
            controller: firstNamecontroller,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextFormField(
            controller: lastcontroller,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          SizedBox(
            height: 10,
          ),
          _usermodel == null ? Text('error') : Text(_usermodel!.userName),
          FloatingActionButton(
            onPressed: () async {
              Usermodel? usermodel = await Apiservices().createdata(
                  id: idcontroller.text,
                  name: firstNamecontroller.text,
                  job: lastcontroller.text);
              print('modeldata========');
              print(usermodel);

              setState(() {
                _usermodel = usermodel;
              });

              Apiservices().getdata(usermodel!.id.toString());
              Apiservices().updatedata("2566");
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
