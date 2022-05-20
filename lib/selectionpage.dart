import 'dart:ffi';

import 'package:flutter/material.dart';

class SelectionPage extends StatefulWidget {

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  String level = "option";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8.0),
            ),
            SizedBox(
              height: 112,
            ),

            Container(
              margin: EdgeInsets.only(),
              child: const Center(
                child: Text(
                  "Please select your profile",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) ,
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Container(
              width: 360,
              height: 90,
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black
                  )
              ),
              child: RadioListTile(
                value: "SHIPPER",
                groupValue: level,
                secondary: Image(
                  image: AssetImage('assets/Capture2.PNG'),
                ),
                title: Text("SHIPPER",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text("Lorem ipsum dolor sit amet consectetur adipiscing",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                onChanged: (value){
                  setState(() {level = value.toString();});
                },
                activeColor: Colors.indigo[900],
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            SizedBox(
              height: 25,
            ),

            Container(
              width: 360,
              height: 90,
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black
                ),
              ),
              child: RadioListTile(
                value: "TRANSPORTER",
                groupValue: level,
                secondary: Image(
                  image: AssetImage('assets/Capture3.PNG'),
                ),
                title: Text("TRANSPORTER",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text("Lorem ipsum dolor sit amet consectetur adipiscing",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
                onChanged: (value){
                  setState(() {level = value.toString();});
                },
                activeColor: Colors.indigo[900],
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(15),
              width: 360.0,
              height: 64,
              child: ElevatedButton(
                onPressed: (){
                },
                child: Text('CONTINUE',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0)
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[900]
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
