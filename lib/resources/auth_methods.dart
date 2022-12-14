import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:society_app/models.dart/user.dart' as model;
import 'package:society_app/resources/storage_methods.dart';

class AuthMethods {
   final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap = await _firestore
    .collection('users')
    .doc(currentUser.uid).get();
   
    return model.User.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async{
    String res = "Error occurred";
    UserCredential cred;
    try{
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null
          ) {
            //register user
            final usercred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
            cred = usercred;
            // print(cred.user!.uid);
            String photoUrl = await StorageMethods().uploadImageToStorage('profilePics', file, false);
            
            // add user to our database
            model.User user = model.User(
              username: username,
              uid: cred.user!.uid,
              email: email,
              bio: bio,
              photoUrl: photoUrl,
              role: "user",
              followers: [],
              following: [],
              visitors: [],
            );


            await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());

            res = "success";
          }else {
        res = "Please enter all the fields";
      }
    }on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch(err){
      res = err.toString();
    }
    return res;
  }


  // login
  Future<String> loginUser({
    required String email,
    required String password,
  })async{
    String res = "Error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }else{
        res = "Please enter all the fields";
      }
    } 
    catch(e){
      res = e.toString();
    }
    return res;
  }

  // signout

  Future<void> signOut() async {
    await _auth.signOut();
  }


}