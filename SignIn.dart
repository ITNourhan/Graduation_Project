import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Color(0xFF3A5985),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(top: 80, child: _buildTop()),
              Positioned(bottom: 0, child: _buildBottom()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 100,
            color: Color(0xff618FCA),
          ),

        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/Loggo.png',
                      height: 110,
                    ),
                    const SizedBox(height: 10)
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "مرحباً",
          style: TextStyle(
            color: Color(0xff3A5985),
            fontSize: 32,
            fontWeight: FontWeight.normal,
            fontFamily: 'Almarai',
          ),
          textDirection: TextDirection.rtl,
        ),
        _buildGreyText("الرجاء تسجيل الدخول بمعلوماتك"),
        const SizedBox(height: 60),
        _buildGreyText("عنوان البريد الإلكتروني"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGreyText("كلمة المرور"),
        _buildInputField(passwordController, isPassword: true),
        const SizedBox(height: 20),
        _buildRememberForgot(),
        const SizedBox(height: 20),
        _buildLoginButton(),
        const SizedBox(height: 20),
        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey,
        fontFamily: 'Almarai',
      ),
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassword
            ? Icon(
          Icons.remove_red_eye,
          color: Color(0xff3A5985),
        )
            : Icon(
          Icons.done,
          color: Color(0xff3A5985),
        ),
      ),
      obscureText: isPassword,
      textDirection: TextDirection.rtl,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
            ),
            _buildGreyText("تذكرني"),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: _buildGreyText("لقد نسيت كلمة المرور"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("البريد الإلكتروني: ${emailController.text}");
        debugPrint("كلمة المرور: ${passwordController.text}");
      },

      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 20,
        minimumSize: const Size.fromHeight(60),
        backgroundColor: Color(0xff3A5985), // Change the color here
      ),
      child: const Text(
        "تسجيل الدخول",
        style: TextStyle(
          fontFamily: 'Almarai',
        ),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("أو قم بتسجيل الدخول باستخدام"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/facebook.png")),
              Tab(icon: Image.asset("assets/twitterr.jpg")),
              Tab(icon: Image.asset("assets/insta.png")),
            ],
          ),
        ],
      ),
    );
  }
}
