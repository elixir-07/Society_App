// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:society_app/screens/chat/message_bubble.dart';

// class Message extends StatelessWidget {
//   const Message({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Query<Map<String, dynamic>> users =  FirebaseFirestore.instance
//     .collection('module_chat')
//     .orderBy('timestamp', descending: true);

//     final user = FirebaseAuth.instance.currentUser; 

//     return FutureBuilder(
//       future: Future.value(FirebaseFirestore.instance),
//       // Future.value(user), //
//       builder: (ctx, futureSnapshot) {
//         if (futureSnapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//       stream: users.snapshots(),
//       builder: (ctx, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> chatSnapshot) {
//             if (chatSnapshot.connectionState == ConnectionState.waiting) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//             final chatDocs = chatSnapshot.data!.docs;
//             return ListView.builder(
//               reverse: true,
//               itemCount: chatDocs.length,
//               itemBuilder: (ctx, index) =>
//                 // Text(chatDocs[index]['text'])
//               MessageBubble(
//                   chatDocs[index].data()['text'],
//                   chatDocs[index].data()['name'],
//                   // chatDocs[index]['userImage'],
//                   chatDocs[index].data()['userId'] == user!.uid,
//                   key: ValueKey(chatDocs[index].id),
//                 ),
//               );
//       }
//       );
//       }
      
//       );

    
//   }
// }