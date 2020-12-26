import 'package:flutter/material.dart';
import 'package:wisefood/models/users.dart';
import 'package:wisefood/models/user.dart';
import 'package:wisefood/widgets/home.dart';

const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
final validatePhone = RegExp(pattern);

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  var _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
  final _formKey = GlobalKey<FormState>();

  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final imagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Users u = new Users();
    User user = new User();
    Widget submit = FlatButton(
      child: Text(
        "Submit",
      ),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
        // user(
        //   namecontroller.text,
        //   passwordcontroller.text,
        //   mobilecontroller.text,
        //   usernamecontroller.text,
        //   imagecontroller.text,
        // );
        u.addUser(user);
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.contains(validCharacters)) {
                        return 'Please enter the correct format';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      print('saved value is $value');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter data';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      print('saved value is $value');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.contains(validCharacters)) {
                        return 'Please enter the correct format';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      print('saved value is $value');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Confirm Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.contains(validCharacters)) {
                        return 'Please enter the correct format';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      print('saved value is $value');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Mobile Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.contains(validatePhone)) {
                        return 'Please enter the correct format';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        labelText: "Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.contains(validCharacters)) {
                        return 'Please enter the correct format';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.green[300],
                    child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        // Validate returns true if the form is valid, or false

                        // otherwise.
                        if (_formKey.currentState.validate()) {
                          // If the form is valid, display a Snackbar.

                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                          _formKey.currentState.save();

                          _formKey.currentState.reset();
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('Please Fill all Fields')));
                        }
                        // _formKey.currentState.save();
                      },
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: FlatButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.

                            if (_formKey.currentState.validate()) {
                              return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content:
                                        Text("Account created successfully"),
                                    actions: [submit],
                                  );
                                },
                              );
                            }
                          },
                          child: Text('Sign Up'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
