
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:otp_verification_project/otpverification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage>
{
  TextEditingController _controller = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 112,),

            Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0)
            ),
            Container(
              margin: EdgeInsets.only(),
              child: const Center(
                child: Text(
                  "Please enter your mobile number",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25) ,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 95, top: 8, right: 94),
              child: const Center(
                child: Text(
                  "You'll receive a 6 digit code to verify next",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
                ),
              ),
            ),
            SizedBox(
              width: 400,
              height: 32,
            ),

            Container(
                width: 360,
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black)
                ),
                child: Stack(
                  children: [
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number){
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      cursorColor: Colors.black,
                      selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.DROPDOWN
                      ),
                      ignoreBlank: false,
                      maxLength: 15,
                      keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: _controller,
                      formatInput: false,
                      onSaved: (PhoneNumber number) {
                        print('On Saved : $number');
                      },
                      inputDecoration: InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          hintText: 'Mobile Number',
                          helperStyle: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 40
                          )
                      ),
                    )
                  ],
                )
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (c) => OTPControllerScreen(
                    phonenumber: _controller.text,
                  )));
                },
                child: Text('CONTINUE',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0)
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[900]
                ),
              ),
            ),
            SizedBox(
              height: 110,
            ),
            Container(
              margin: EdgeInsets.all(0),
              height: 200,
              child: Image(
                image: AssetImage('assets/wave2.png'),
                fit: BoxFit.fitWidth,
              ),
            )


          ],
        ),
      ),
    );


  }
}
