import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:society_app/screens/posts/add_post_button.dart';
import 'package:society_app/screens/posts/post_card.dart';
import 'package:society_app/utils.dart/colors.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Social Media'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddPostButton())),
            icon: const Icon(Icons.add_to_photos_outlined))
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').orderBy('datePublished', descending: true).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => PostCard(
              snap: snapshot.data!.docs[index].data(),
            ),
            );
        },
      ),
    );
  }
}