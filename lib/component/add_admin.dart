import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAdmin extends StatefulWidget {
  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  final TextEditingController _emailController = TextEditingController();

  void _addAdminEmail() {
    String email = _emailController.text.trim();

    // Add the email to Firebase Firestore
    FirebaseFirestore.instance.collection('admin_emails').add({
      'email': email,
    }).then((value) {
      // Email added successfully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Admin email added')),
      );

      // Clear the text field
      _emailController.clear();
    }).catchError((error) {
      // Error occurred while adding email
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to add admin email')),
      );
    });
  }

  void _removeAdminEmail(String docId) {
    // Remove the email from Firebase Firestore
    FirebaseFirestore.instance
        .collection('admin_emails')
        .doc(docId)
        .delete()
        .then((value) {
      // Email removed successfully
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Admin email removed')),
      );
    }).catchError((error) {
      // Error occurred while removing email
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to remove admin email')),
      );
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Emails'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addAdminEmail,
              child: const Text('Add Email'),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Admin Emails',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('admin_emails')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final emails = snapshot.data!.docs;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: emails.map((doc) {
                      final docId = doc.id;
                      final email = doc['email'];

                      return ListTile(
                        title: Text(email),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _removeAdminEmail(docId),
                        ),
                      );
                    }).toList(),
                  );
                }

                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
