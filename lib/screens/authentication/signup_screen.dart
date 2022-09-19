import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:society_app/resources/auth_methods.dart';
import 'package:society_app/responsive/mobile_layout.dart';
import 'package:society_app/responsive/responsive_layout.dart';
import 'package:society_app/responsive/web_layout.dart';
import 'package:society_app/screens/authentication/login_screen.dart';
import 'package:society_app/screens/authentication/text_field_input.dart';
import 'package:society_app/utils.dart/colors.dart';
import 'package:society_app/utils.dart/utils.dart';

class SignUpScreen extends StatefulWidget {
  static const String routename = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void signupUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        username: _usernameController.text.trim(),
        bio: _bioController.text.trim(),
        file: _image!);

    setState(() {
      _isLoading = false;
    });

    if(res == "success"){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(), 
                  webScreenLayout: WebScreenLayout()
                  )));
      
    }else {
      // print(res);
      showSnackBar(context, res);
    }
  }

  
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              const Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 35,
                    color: primaryColor, //Colors.green,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              // 'https://i.stack.imgur.com/l60Hf.png'
                              'https://as2.ftcdn.net/v2/jpg/00/64/67/63/1000_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg'),
                          // backgroundColor: Colors.amber,
                        ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: gradiantColor,
                        ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: 'UserName',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _emailController,
                hintText: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: 'Password',
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                textEditingController: _bioController,
                hintText: 'Bio',
                textInputType: TextInputType.text,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                height: 50,
                width: 300,
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [ primaryColor, gradiantColor] //Colors.green, Colors.lightGreen],
                    )),
                child: InkWell(
                  onTap: signupUser,
                  child:  Center(
                    child: !_isLoading
                    ? const Text(
                      'SignUp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                    : const CircularProgressIndicator(color: secondaryColor,),
                  ),
                ),
              ),
              const SizedBox(height: 24,),
              TextButton(
                onPressed: () =>
                  Navigator.of(context).pushNamed(LoginScreen.routename)
                , 
                child: const Text("Already have an account? LOGIN")
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
