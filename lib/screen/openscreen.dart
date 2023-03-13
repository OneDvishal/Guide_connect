import 'package:flutter/material.dart';

class OpenScreen extends StatefulWidget {
  const OpenScreen({super.key});

  @override
  State<OpenScreen> createState() => _OpenScreenState();
}

class _OpenScreenState extends State<OpenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 247,
            ),
            Image.asset('assets/logo/app_logo.png'),
            const SizedBox(
              height: 96,
            ),
            const Text(
              'Welcome to',
              style: TextStyle(fontSize: 31, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'guide',
                  style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(254, 146, 161, 1),
                  ),
                ),
                Text(
                  'CONNECT',
                  style: TextStyle(
                    fontSize: 41,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(92, 61, 164, 1),
                  ),
                ),
              ],
            ),
            const Text(
              'Login to your account and get\n notified about all the events.',
              style: TextStyle(
                  fontSize: 28, color: Color.fromRGBO(159, 154, 168, 1)),
            ),
            const SizedBox(height: 245,)
            ,
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle( padding:const MaterialStatePropertyAll(EdgeInsets.only(left: 20,right: 20)),
                  maximumSize: const MaterialStatePropertyAll(Size(368, 58)),
                  minimumSize:const MaterialStatePropertyAll(Size(368, 58)),
                  backgroundColor: const MaterialStatePropertyAll(
                      Color.fromRGBO(92, 61, 164, 1)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)))),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo/mail.png'),
                  Container(
                    padding: const EdgeInsets.only(left: 100,right: 100),
                    child: const Text(
                      "signup",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}