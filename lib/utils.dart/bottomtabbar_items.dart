import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:society_app/screens/notice/notice_screen.dart';
import 'package:society_app/screens/posts/feed_screen.dart';
import 'package:society_app/screens/profile/profile_screen.dart';
import 'package:society_app/screens/search_screen.dart';
import 'package:society_app/visitors/visitor_screen.dart';

List<Widget> BottomTabBarItems = [
  const FeedScreen(),
  const SearchScreen(),
  const NoticeScreen(),
  const VisitorScreen(),
  // AddPostScreen(),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
    ),
];