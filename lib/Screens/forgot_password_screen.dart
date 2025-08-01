import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xpool/Screens/login_screen.dart';
import 'package:xpool/global/gobal.dart';


class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final emailTextEditingController = TextEditingController();

  //declare a Globalkey
  final _formKey = GlobalKey<FormState>();

  void _submit () {
    firebaseAuth.sendPasswordResetEmail(
        email: emailTextEditingController.text.trim()
    ).then((value){
      Fluttertoast.showToast(msg: "We have sent you an email to recover password, please check email");
    }).onError((error, stackTrace){
      Fluttertoast.showToast(msg: "Error Occured: \n ${error.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {

    bool darkTheme = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(0),
          children: [
            Column(
              children: [
                Image.asset(darkTheme ? 'images/xpool_1_dark.jpg' : 'images/xpool_1.jpg'),

                SizedBox(height: 20,),

                Text(
                  'Forgot Password ',
                  style: TextStyle(
                    color: darkTheme ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15,20,15,50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(100)
                              ],
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                filled: true,
                                fillColor: darkTheme ? Colors.black45 : Colors.grey.shade200,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40),
                                    borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none
                                    )
                                ),
                                prefixIcon: Icon(Icons.person, color: darkTheme ? Colors.white : Colors.grey,),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (text){
                                if(text == null || text.isEmpty){
                                  return 'Email can\'t be empty';
                                }
                                if(EmailValidator.validate(text) == true){
                                  return null;
                                }
                                if(text.length < 2) {
                                  return "Please enter a valid Email";
                                }
                                if(text.length > 99) {
                                  return "Email can\'t be more than 100";
                                }
                                return null;
                              },
                              onChanged: (text) => setState(() {
                                emailTextEditingController.text = text;
                              }),
                            ),

                            SizedBox(height: 15,),

                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    foregroundColor: darkTheme ? Colors.black : Colors.white,
                                    backgroundColor: darkTheme ? Colors.white: Colors.black,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    minimumSize:  Size(double.infinity, 50)
                                ),
                                onPressed: () {
                                  _submit();
                                },
                                child: Text(
                                  'Send Reset Password',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                            ),

                            SizedBox(height: 10,),

                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: darkTheme ? Colors.white : Colors.black,
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                  ),
                                ),

                                SizedBox(width: 10,),

                                GestureDetector(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: darkTheme ? Colors.white : Colors.black
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
