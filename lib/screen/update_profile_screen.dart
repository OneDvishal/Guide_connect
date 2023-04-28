

import 'package:flutter/material.dart';
import 'package:guideconnect/component/nevBar.dart';



class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        
        title: Text(
          "Guide Connect",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular((100.0)),
                      child: const Image(
                        image: AssetImage("assets/images/profile_pic.png"),
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
                      child: const Icon(
                        Icons.camera,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Username"),
                      prefixIcon: Icon(Icons.person_2_outlined),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                 
                  
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("password"),
                      prefixIcon: Icon(Icons.fingerprint),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          side: BorderSide.none,
                          shape: const StadiumBorder()),
                      child: const Text(
                        "Save Changes",
                        style:
                             const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.redAccent.withOpacity(0.1),
                              elevation: 0,
                              foregroundColor: Colors.red,
                              shape: const StadiumBorder(),
                              side: BorderSide.none),
                          child: const Text("Delete"))
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
      // bottomNavigationBar: nevBar(),
    );
  }
}
