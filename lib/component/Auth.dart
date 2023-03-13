import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:matcher/matcher.dart';

class AuthForm extends StatefulWidget {
  final void Function(String email,String username,String password,bool islogin) submitfm;
   AuthForm(this.submitfm,);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  var _email = "";
  var _username = "";
  var _password = "";
  bool _islogin = true;
  void Log(){
    FocusScope.of(context).unfocus();

    final isvalid = _formkey.currentState?.validate();
    if(isvalid as bool){
      _formkey.currentState?.save();
      widget.submitfm(_email,_username,_password,_islogin);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              
              child: Form(
                key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return "enter valid email id";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text(
                        "email",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onSaved: (Value) => _email = Value as String,
                  ),

                  if(!_islogin)
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (value) {
                      if (value == null || value.length < 7) {
                        return "enter valid username";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text(
                        "username",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onSaved: (Value) => _username = Value as String,
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return "enter valid password";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text(
                        "password",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    onSaved: (Value) => _password = Value as String,
                  ),
                  ElevatedButton(
                    onPressed: Log,
                    child: Text(
                      _islogin ? "Login" : "Signup",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _islogin = !_islogin;
                      });
                    },
                    child: Text(
                      _islogin ? "I don't have account" : "I have account",
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ),
        ),
      ),
    );
  }
}
