import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_vet/login.dart';
import 'package:google_sign_in/google_sign_in.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
class vetPage extends StatefulWidget {
  const vetPage({Key? key}) : super(key: key);

  @override
  State<vetPage> createState() => _vetPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<FormState> _formKeySecond = GlobalKey<FormState>();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final TextEditingController userNameController = TextEditingController();
//AuthService _authService = AuthService();

bool _success = false;
String _message = "";
bool isChecked = false;
bool passwordVisible = false;
String? username;
bool _canPop = false;

class choose {
  String? username;

  choose({
    required this.username,
  });
}

choose name = new choose(username: "user");

class _vetPageState extends State<vetPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
              body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  top: 0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                    ),
                    Image(image: AssetImage('assets/dog.png')),
                    SizedBox(
                      height: 10,
                    ),
                    TabBar(
                      indicatorWeight: 5,
                      indicatorColor: Colors.grey,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                          text: "Login",
                        ),
                        Tab(
                          text: "Sign-up",
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 415,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TabBarView(children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter email' : null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: passwordVisible,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            prefixIcon: Icon(Icons.key),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter password'
                                : null;
                          },
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.blueGrey, Colors.grey]),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                dynamic result = await signIn(
                                    _emailController.text,
                                    _passwordController.text);

                                if (result != null) {
                                  setState(() {
                                    name.username = _emailController.text;
                                    Navigator.pushReplacement<void, void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            const Login(),
                                      ),
                                    );
                                  });
                                }
                                _emailController.clear();
                                _passwordController.clear();
                              }
                            },
                            child: Text(
                              'Login ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              '- OR -',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            )),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              'SignIN with',
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 13),
                            )),
                        SizedBox(
                          height: 6,
                        ),
                        InkWell(
                          onTap: () async {
                            dynamic result = await signInWithGoogle();

                            if (_formKey.currentState!.validate()) {
                              dynamic result = await signInWithGoogle();

                              if (result != null) {
                                setState(() {
                                  Navigator.pushReplacement<void, void>(
                                    context,
                                    MaterialPageRoute<void>(
                                      builder: (BuildContext context) =>
                                          const Login(),
                                    ),
                                  );
                                });
                              }
                            }
                          },
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0,
                                )
                              ],
                              image: DecorationImage(
                                  image: AssetImage('assets/google.png')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKeySecond,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: userNameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            hintText: 'Enter username',
                            prefixIcon: Icon(Icons.supervised_user_circle),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter username'
                                : null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'Enter email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter email' : null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: passwordVisible,
                          controller: _passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            prefixIcon: Icon(Icons.key),
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Please enter password'
                                : null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(
                                colors: [Colors.blueGrey, Colors.grey]),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              _formKeySecond.currentState?.validate();
                              dynamic result = await signUp(
                                  _emailController.text,
                                  _passwordController.text);
                              _emailController.text = userNameController.text;
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  //title: Text("Alert"),
                                  content: Text("Başarıyla Kayıt Oldunuz"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _canPop = true;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Ok"),
                                    ),
                                  ],
                                ),
                              );
                              _emailController.clear();
                              _passwordController.clear();
                              userNameController.clear();

                              // if (result != null) {
                              //   setState(() {
                              //     name.username = userNameController.text;
                              //     Navigator.pushReplacement<void, void>(
                              //       context,
                              //       MaterialPageRoute<void>(
                              //         builder: (BuildContext context) =>
                              //             const Login(),
                              //       ),
                              //     );
                              //   });
                              // }

                              // _register();
                            },
                            child: Text(
                              'Sign Up ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Future signUp(String email, String password) async {
    try {
      final user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text('Başarıyla Kayıt oldunuz..')));
      return user.user!;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    } catch (e) {
      print(e.toString());
    }
  }

  Future signIn(String email, String password) async {
    try {
      final user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Başarıyla giriş yaptınız..')));
      return user.user!;
      //final User user = userCredential.user!;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //return await FirebaseAuth.instance.signInWithCredential(credential);
      final user = await _auth.signInWithCredential(credential);
      // final UserCredential userCredential =
      //     await _auth.signInWithCredential(credential);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Başarıyla giriş yaptınız..')));
      // final User? user = userCredential.user;

      return user.user!;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    } catch (e) {
      print(e.toString());
    }
  }
}
