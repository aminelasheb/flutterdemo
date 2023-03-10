import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _signup = false;

  @override
  Widget build(BuildContext context) {
    final sizee = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: sizee.height * 0.08),
            child: SizedBox(
              height: sizee.height * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
                              )),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: sizee.height * 0.1,
                      width: sizee.width * 0.5,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: sizee.width * 0.1),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        _signup ? 'Register with us' : 'Login to your account',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: sizee.width * 0.06),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _signup
                            ? SizedBox(
                                width: sizee.width * 0.8,
                                child: TextFormField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.email),
                                    hintText: 'Write your name please',
                                    labelText: 'Name',
                                  ),
                                  onSaved: (String? value) {},
                                  validator: (value) {
                                    if (value == null || value.length < 3) {
                                      return 'Not valid name';
                                    }
                                    return null;
                                  },
                                ),
                              )
                            : Container(),
                        SizedBox(
                          width: sizee.width * 0.8,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Write your mail please',
                              labelText: 'Email',
                            ),
                            onSaved: (String? value) {},
                            validator: (String? value) {
                              if (value == null || !value.contains('@')) {
                                return 'Not valid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          width: sizee.width * 0.8,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              hintText: 'Please write your password',
                              labelText: 'Password',
                            ),
                            onSaved: (String? value) {},
                            validator: (String? value) {
                              if (value == null || value.length < 6) {
                                return 'Not valid password';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _formKey.currentState!.validate();
                    },
                    child: Container(
                      width: sizee.width * 0.8,
                      height: sizee.height * 0.08,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(!_signup ? "Login" : "Signup",
                              style: TextStyle(color: Colors.white))),
                    ),
                  ),
                  Column(
                    children: [
                      Text('Or sign in, with'),
                      SizedBox(
                        height: sizee.height * 0.020,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: sizee.width * 0.2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            iconWidget(sizee,
                                "https://img.icons8.com/ios/250/000000/facebook-new.png"),
                            iconWidget(sizee,
                                "https://img.icons8.com/ios/250/000000/google-logo.png"),
                            iconWidget(sizee,
                                "https://img.icons8.com/ios/250/000000/instagram-new.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: sizee.width * 0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(_signup
                            ? "Have you an account"
                            : "Haven't you an account ?"),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _signup = !_signup;
                            });
                          },
                          child: Text(
                            _signup ? "Login " : 'Signup',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container iconWidget(Size sizee, String url) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      url,
                    )),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            height: sizee.width * 0.1,
            width: sizee.width * 0.1,
          ),
        ],
      ),
    );
  }
}
