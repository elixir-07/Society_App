import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:society_app/providers/user_provider.dart';
import 'package:society_app/resources/firestore_methods.dart';
import 'package:society_app/utils.dart/colors.dart';
import 'package:society_app/utils.dart/utils.dart';

class AddPostScreen extends StatefulWidget {
  static const String routename = '/addpost-screen';
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FirestoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Posted!',
        );
        clearImage();
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(
                Icons.upload,
              ),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
                backgroundColor: mobileBackgroundColor,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: clearImage,
                ),
                title: const Text(
                  'Post to',
                ),
                centerTitle: false,
                actions: <Widget>[
                  TextButton(
                    onPressed: () => postImage(
                      userProvider.getUser.uid,
                      userProvider.getUser.username,
                      userProvider.getUser.photoUrl,
                    ),
                    child: const Text(
                      "Post",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter,
                              image: MemoryImage(_file!),
                            )),
                          ),
                      
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                              hintText: "Write a caption...",
                              border: InputBorder.none),
                          maxLines: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              )
        
            );
  }
}
