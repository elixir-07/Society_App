// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:society_app/models/current_user.dart';
// import 'package:society_app/screens/chat/message.dart';
// import 'package:provider/provider.dart';

// class ChatScreen extends StatefulWidget {
//   static const String routename = '/chat-screen';
//   const ChatScreen({ Key? key }) : super(key: key);

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
  

//   @override
//   Widget build(BuildContext context) {

//     String _message = '';
//     var _textController = TextEditingController();

//     void _sendmessage() async {
//       FocusScope.of(context).unfocus();
//       final user = await FirebaseAuth.instance.currentUser!;
//       final userData = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//       FirebaseFirestore.instance.collection('module_chat').add(
//         {
//         'text': _message,
//         'name': userData.data()!['name'],
//         'email': userData.data()!['email'],
//         'userId': user.uid,
//         'timestamp': Timestamp.now(),
//         }
//       );
//       _textController.clear();
//     }


//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Expanded(
//               child: Message(),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 10,
//                     child: TextField(
//                       controller: _textController,
//                       onChanged: (val) {
//                         _message = val;
//                       },
//                       // (value) {
//                       //   setState(() {
//                       //     _message = value;
//                       //   });},
//                       decoration: const InputDecoration(
//                         // fillColor: kSpaceCadet,
//                         filled: true,
//                         hintText: 'Type a message...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(30.0),
//                           ),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: IconButton(
//                       // color: kAmaranth,
//                       onPressed: _sendmessage,
//                       // _message.trim().isEmpty ? null : _sendmessage,
//                       icon: Icon(Icons.send),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 8.0,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }