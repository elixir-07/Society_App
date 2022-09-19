import 'package:flutter/material.dart';
import 'package:society_app/resources/auth_methods.dart';
import 'package:society_app/responsive/mobile_layout.dart';
import 'package:society_app/responsive/responsive_layout.dart';
import 'package:society_app/responsive/web_layout.dart';
import 'package:society_app/screens/authentication/signup_screen.dart';
import 'package:society_app/screens/authentication/text_field_input.dart';
import 'package:society_app/utils.dart/colors.dart';
import 'package:society_app/utils.dart/utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routename = '/login-screen';
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override

  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser()async{
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text.trim(), password: _passwordController.text.trim()
      );

    if(res == "success"){

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout(),
        )
        ));

      setState(() {
      _isLoading = true;
    });

    }else{
      setState(() {
      _isLoading = true;
    });
      showSnackBar(context, res);
    }
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Flexible(
                child: Container(),
                flex: 2,
              ),

              const Text(
                'Login', 
                style: TextStyle(
                  fontSize: 35,
                  color: primaryColor,
                  fontWeight: FontWeight.w900
                ),
              ),
              const SizedBox(height: 50,),

              TextFieldInput(
                textEditingController: _emailController, 
                hintText: 'Email', 
                textInputType: TextInputType.emailAddress,
                ),

              const SizedBox(height: 24,),

              TextFieldInput(
                textEditingController: _passwordController, 
                hintText: 'Password', 
                textInputType: TextInputType.text,
                isPass: true,
                ), 

              const SizedBox(height: 24,),

              Container(
              height: 50,
              width: 300,
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              // padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [ primaryColor, gradiantColor],
                  )),
              child: InkWell(
                onTap: loginUser,
                child: Center(
                  child: !_isLoading 
                  ? const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                  : const CircularProgressIndicator(
                    color: secondaryColor,
                  )
                ),
              ),
            ),

              const SizedBox(height: 24,),

              TextButton(
                onPressed: () =>
                  Navigator.of(context).pushNamed(SignUpScreen.routename)
                , 
                child: const Text("Don't have an account? SIGN UP")
                ),

              Flexible(
                child: Container(),
                flex: 2,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}