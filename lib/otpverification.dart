import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_verification_project/selectionpage.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPControllerScreen extends StatefulWidget {
  final String phonenumber;

  OTPControllerScreen({ required this.phonenumber,});


  @override
  State<OTPControllerScreen> createState() => _OTPControllerScreenState();
}

class _OTPControllerScreenState extends State<OTPControllerScreen>
{
  final GlobalKey<ScaffoldState> _scaffolkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinOTPCodeController = TextEditingController();
  final FocusNode _pinOTPCodeFocus = FocusNode();
  String? varificationCode;

  final BoxDecoration pinOTPCodeDecoration = BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey,
      )
  );

  @override
  void initState(){
    super.initState();

    verifyPhoneNumber();
  }
  verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "${widget.phonenumber}",
        verificationCompleted: (PhoneAuthCredential credential) async
        {
          await FirebaseAuth.instance.signInWithCredential(credential).then((value) async {
            if(value.user !=null){
              Navigator.of(context).push(MaterialPageRoute(builder: (c) => SelectionPage() ));
            }
          });
        },
        verificationFailed: (FirebaseAuthException e){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message.toString()),
              duration: Duration(seconds: 60),
            ),
          );
        },
        codeSent: (String vID, int? resendToken){
          setState(() {
            varificationCode = vID;
          });
        },
        codeAutoRetrievalTimeout: (String vID){
          setState(() {
            varificationCode = vID;
          });
        },
        timeout: Duration(seconds: 60)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolkey,
      appBar: AppBar(
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: const EdgeInsets.all(8.0),
          ),

          Container(
            margin: EdgeInsets.only(),
            child: const Center(
              child: Text(
                "Verify Number",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20) ,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: GestureDetector(
                onTap: (){

                },
                child: Text(
                  "Code is sent to ${widget.phonenumber}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
              ),
            ),
          ),

          Padding(padding: EdgeInsets.all(40.0),
            child: PinPut(
                fieldsCount: 6,
                textStyle: TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 48.0,
                eachFieldHeight: 48.0,
                focusNode: _pinOTPCodeFocus,
                controller: _pinOTPCodeController,
                submittedFieldDecoration: pinOTPCodeDecoration,
                selectedFieldDecoration: pinOTPCodeDecoration,
                followingFieldDecoration: pinOTPCodeDecoration,
                pinAnimationType: PinAnimationType.rotation,
                onSubmit: (pin) async
                {
                  try {
                    await FirebaseAuth.instance.signInWithCredential(
                        PhoneAuthProvider.credential(
                            verificationId: varificationCode!, smsCode: pin)).then((value) async {
                      if(value.user !=null){
                        Navigator.of(context).push(MaterialPageRoute(builder: (c) => SelectionPage() ));
                      }
                    });
                  }
                  catch (e) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid OTP"),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  }
                }
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            child: Text(
              "Didn't receive the code ?",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0),
            child: Center(
              child: GestureDetector(
                onTap: (){
                  verifyPhoneNumber();
                },
                child: Text(
                  "Resend OTP",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(15),
            width: 328.0,
            height: 64,
            child: ElevatedButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (c) => SelectionPage()));
              },
              child: Text('VERIFY AND CONTINUE',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0)
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[900]
              ),
            ),
          )

        ],
      ),
    );
  }
}
