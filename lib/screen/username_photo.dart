import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePhoto extends StatefulWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  State<ProfilePhoto> createState() => _ProfilePhotoState();
}

class _ProfilePhotoState extends State<ProfilePhoto> {
  File? _imagePicker;
  String? _uploadedImageUrl;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 25);
    setState(() {
      _imagePicker = File(pickedFile!.path);
    });
  }

  Future<void> _uploadImageToFirebaseStorage() async {
    if (_imagePicker != null) {
      try {
        final reference = firebase_storage.FirebaseStorage.instance
            .ref('images/${FirebaseAuth.instance.currentUser?.uid}');
        final uploadTask = reference.putFile(_imagePicker!);

        final snapshot = await uploadTask.whenComplete(() {});

        if (snapshot.state == firebase_storage.TaskState.success) {
          final imageUrl = await reference.getDownloadURL();

          setState(() {
            _uploadedImageUrl = imageUrl;
          });

          // Update Firestore user collection with the download URL
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            final userDoc =
                FirebaseFirestore.instance.collection('user').doc(user.uid).update({
                  'profileImageUrl':imageUrl
                });
          }
        } else {
          print('Failed to upload image');
        }
      } catch (error) {
        print('Failed to upload image: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        _pickImage();
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.0),
                          image: DecorationImage(
                            image: _imagePicker != null
                                ? FileImage(_imagePicker!)
                                    as ImageProvider<Object>
                                : const AssetImage(
                                    'assets/images/profile_pic.png'),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.yellow,
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 20.0,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _pickImage();
                          },
                        ),
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                  onPressed: _uploadImageToFirebaseStorage,
                  child: const Text('Upload Image'),
                ),
                if (_uploadedImageUrl != null)
                  Image.network(_uploadedImageUrl!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
