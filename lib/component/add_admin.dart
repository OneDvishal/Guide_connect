import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAdmin extends StatefulWidget {
  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  final TextEditingController _emailController = TextEditingController();

  void _addAdminEmail() {
    // _emailController.text.trim();
    FocusScope.of(context).unfocus();
    // Add the email to Firebase Firestore
    FirebaseFirestore.instance.collection('admin_emails').doc().set({
      'Email': _emailController.text.trim(),
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, // Change the color of the back arrow here
        ),
        title: const Text(
          'Admin Emails',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
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
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(double.infinity, 50), // Set the height to 50
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: _addAdminEmail,
              child: const Text('Add Email'),
            ),
            const SizedBox(height: 25.0),
            const Text(
              'Admin Emails',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
  child: StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('admin_emails')
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final emails = snapshot.data!.docs;

        return ListView.builder(
          itemCount: emails.length,
          itemBuilder: (context, index) {
            final docId = emails[index].id;
final email = (emails[index].data() as Map<String, dynamic>?)?['email'] as String?;

            return ListTile(
              title: Text(email ?? ''),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.black),
                onPressed: () => _removeAdminEmail(docId),
              ),
            );
          },
        );
      }

      return const Center(child: CircularProgressIndicator());
    },
  ),
),

          ],
        ),
      ),
    );
  }
}
