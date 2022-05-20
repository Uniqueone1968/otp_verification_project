import 'package:flutter/material.dart';
import 'package:language_picker/language_picker.dart';
import 'package:language_picker/languages.dart';
import 'package:otp_verification_project/loginpage.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 120,),

            Padding(padding: const EdgeInsets.only(left: 30.0, right: 30.0)
            ),
            Container(
              margin: EdgeInsets.all(0),
              height: 42,
              child: Image(
                image: AssetImage('assets/Capture.PNG'),
              ),
            ),
            SizedBox(
              height: 39,
            ),

            Container(
              margin: EdgeInsets.only(),
              child: const Center(
                child: Text(
                  "Please select your Language",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 95, top: 8, right: 94),
              child: const Center(
                child: Text(
                  "You can change the language at any time.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Container(
              width: 240,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black)
              ),
              child: Column(
                children: [
                  SizedBox(width: 8.0,),
                  LanguagePickerDropdown(
                      initialValue: Languages.english,
                      onValuePicked: (Language language) {
                        print(language.name);
                      })
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Container(
              margin: EdgeInsets.all(15),
              width: 240.0,
              height: 60,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => LoginPage()));
                },
                child: Text('NEXT',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0)
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[900]
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(0),
              height: 200,
              child: Image(
                image: AssetImage('assets/wave1.png'),
                fit: BoxFit.fitWidth,
              ),
            )

          ],
        ),
      ),
    );
  }
}
