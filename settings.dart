import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: EditProfileUI(),
      ),
    );
  }
}

class EditProfileUI extends StatefulWidget {
  @override
  _EditProfileUIState createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          width: 200, // Adjust the width as needed
          child: Center(
            child: Text(
              "الإعدادات",
              style: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 13,
                color: Color(0xff3A5985),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),



        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Image.asset(
              'assets/Loggo.png',
              height: 45,
            ),
          ],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 2,
              color: Colors.grey[200],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 15, top: 20, right: 15),
                color: Color(0xFFF1F4F8),
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                border: Border.all(width: 4, color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                  )
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/me.jpeg'),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Colors.white,
                                  ),
                                  color: Color(0xff618FCA),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      buildTextField("الاسم بالكامل", "نورهان عادل", false),
                      buildTextField("البريد الإلكتروني", "ITEnginnerNourhan@outlook.com", false),
                      buildTextField("كلمة المرور", "*********", true),
                      buildTextField("محل الإقامة", "الإسكندرية", false),
                      buildTextField("رقم الهاتف", "01032752063", false),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "إلغاء",
                              style: TextStyle(
                                fontFamily: 'Almarai',
                                color: Color(0xff3A5985),
                                fontSize: 11,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "حفظ",
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xff3A5985),
                              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          obscureText: isPasswordTextField ? isObscurePassword : false,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  isObscurePassword = !isObscurePassword;
                });
              },
              icon: Icon(Icons.remove_red_eye, color: Color(0xff618FCA), size: 20,),
            )
                : null,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 11,
              fontFamily: 'Almarai',
              fontWeight: FontWeight.normal,
              color: Colors.grey,
            ),
            alignLabelWithHint: true,
            labelStyle: TextStyle(
              fontFamily: 'Almarai',
              fontWeight: FontWeight.normal,
              color: Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}
