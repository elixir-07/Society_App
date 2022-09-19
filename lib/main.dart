import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society_app/providers/user_provider.dart';
import 'package:society_app/responsive/mobile_layout.dart';
import 'package:society_app/responsive/responsive_layout.dart';
import 'package:society_app/responsive/web_layout.dart';
import 'package:society_app/screens/authentication/login_screen.dart';
import 'package:society_app/screens/authentication/signup_screen.dart';
import 'package:society_app/screens/notice/notice_screen.dart';
import 'package:society_app/screens/posts/add_post_screen.dart';
import 'package:society_app/utils.dart/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBPrUbzI-hVvDYs5SXFb15Q5dK1rZOVHfI", 
        appId: "1:925581673790:web:3fbc23f6c977075f71d86f", 
        messagingSenderId: "925581673790", 
        projectId: "society-app-3b247",
        storageBucket: "society-app-3b247.appspot.com"
        ),
    );
  }
  else{
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Society App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(), 
                  webScreenLayout: WebScreenLayout()
                  );
              } else if(snapshot.hasError){
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const LoginScreen();
          },
        ),
        routes: {
          LoginScreen.routename: (context) => const LoginScreen(),
          SignUpScreen.routename: (context) => const SignUpScreen(),
          // ChatScreen.routename: (context) => const ChatScreen(),
          NoticeScreen.routename: (context) => const NoticeScreen(),
          MobileScreenLayout.routename: (context) => const MobileScreenLayout(),
          AddPostScreen.routename:(context) => const AddPostScreen()
        },
      ),
    );
  }
}
