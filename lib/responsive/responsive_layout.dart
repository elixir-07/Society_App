import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society_app/providers/user_provider.dart';

class ResponsiveLayout extends StatefulWidget {
  static const String routename = '/responsive-screen-layout';
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({ Key? key, required this.mobileScreenLayout, required this.webScreenLayout }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if(constraints.maxWidth > 600){
          return widget.webScreenLayout;
        }
        return widget.mobileScreenLayout;
      }
    );
  }
}