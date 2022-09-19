import 'package:flutter/material.dart';
import 'package:society_app/screens/posts/add_post_screen.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    body: AddPostScreen(),
    );
  }
}
