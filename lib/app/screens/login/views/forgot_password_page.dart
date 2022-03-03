import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int click = 0;
  bool visible = false;
  TextEditingController emailcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var MediaQueryw = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffFBECE5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0, right: 8.0, top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          Image.asset("assets/images/menusolo.png")
                          // SizedBox(width: 12.0),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Image.asset(
                              "assets/images/solo1.png",
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Image.asset("assets/images/magnifying2.png"),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 12.0, right: 12.0),
                            child: Image.asset(
                              "assets/images/like2.png",
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                "assets/images/shoppingbag2.png",height: 30.0,width: 30.0,
                              ),
                              Positioned(
                                  top: 6,
                                  right: -1,
                                  child: Text(
                                    "0",
                                    style: TextStyle(
                                        fontSize: 8.0, color: Colors.black),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(
                    margin: EdgeInsets.only(top: 60.0, bottom: 16.0),
                    child: TextButton(
                      onPressed: () {},
                      child: Stack(
                        children: [
                          Text(
                            "Forgot Your Password?",
                            style: TextStyle( fontSize: 20.0,fontWeight: FontWeight.w600, color:  Color(0xFF8A3A06),
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                          Positioned(
                            bottom: 3.0,
                            child: Container(

                              width: MediaQueryw * 0.6,height: 0.5,color: Color(0xff973133),),
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                    )),

                Container(
                  width: MediaQueryw * 0.7,
                  child: Text(
                    "Please enter your email address below to receive a password re copy",
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  height: 36,
                  width: MediaQueryw * 0.9,
                  margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: Color(0xffFBECE5),
                    border: Border.all(color: Color(0xFF8A3A06), width: 0.8),
                  ),
                  child: TextField(
                    controller: emailcontroller,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      // filled: true,

                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),

                      contentPadding: EdgeInsets.zero,
                      hintText: 'Enter Your Email',
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5 ,
                  child: ElevatedButton(
                    onPressed: () {


                    },
                    child: Text(
                      "RESET MY PASSWORD",
                      style: TextStyle(fontSize:16.0,fontWeight: FontWeight.w600,color: Color(0xffF9EAE3)),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0.0,
                      primary: Color(0xFF8A3A06),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon:Icon(Icons.arrow_back_ios_outlined,
                          size: 16, color: Color(0xff973133)),
                  label:Text(
                      "Back to login",
                      style: TextStyle( fontWeight: FontWeight.w400,fontSize: 16.0,
                        color:  Color(0xFF8A3A06),)

                        ),
                  style: TextButton.styleFrom(
                    //shadowColor: Color(0xffF9EAE3),
                    splashFactory: NoSplash.splashFactory,
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
