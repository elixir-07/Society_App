import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society_app/models.dart/user.dart';
import 'package:society_app/providers/user_provider.dart';
import 'package:society_app/resources/firestore_methods.dart';
import 'package:society_app/screens/posts/comment_card.dart';
import 'package:society_app/utils.dart/colors.dart';

class CommentsScreen extends StatefulWidget {
  final snap;
  const CommentsScreen({Key? key, required this.snap}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentContoller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _commentContoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text('Comments'),
        centerTitle: false,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.snap['postId'])
            .collection('comments').orderBy('datePublished', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot<Map<String,dynamic>>> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) => CommentCard(
              snap: snapshot.data!.docs[index].data(),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user.photoUrl,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                  controller: _commentContoller,
                  decoration: InputDecoration(
                    hintText: 'Comment as ${user.username}',
                    border: InputBorder.none,
                  ),
                ),
              )),
              InkWell(
                onTap: () async {
                  await FirestoreMethods().postComment(
                      widget.snap['postId'],
                      _commentContoller.text,
                      user.uid,
                      user.username,
                      user.photoUrl);
                  setState(() {
                    _commentContoller.text = "";
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Text(
                    'Post',
                    style: TextStyle(color: blueColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
