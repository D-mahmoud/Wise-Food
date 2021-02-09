import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:wisefood/models/store.dart';
import 'package:wisefood/providers/stores.dart';

const pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
final validatePhone = RegExp(pattern);

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  ///image Picker
  final _formKey = GlobalKey<FormState>();
  var _editedStore = Store(
    id: null,
    storeTitle: '',
    rating: 0,
    number: '',
    location: '',
    imageUrl: '',
    review: '',
  );
  var _initValues = {
    'id': 0,
    'storeTitle': '',
    'rating': 0,
    'number': '',
    'location': '',
    'image': '',
    'review': '',
  };
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final storeId = ModalRoute.of(context).settings.arguments as String;
      if (storeId != null) {
        _editedStore =
            Provider.of<Stores>(context, listen: false).findById(storeId);
        _initValues = {
          'id': _editedStore.id,
          'storeTitle': _editedStore.storeTitle,
          'rating': _editedStore.rating,
          'location': _editedStore.location,
          'number': _editedStore.number,
          'image': _editedStore.imageUrl,
        };
        _imageUrlController.text = _editedStore.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(_updateImageUrl);
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void _updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      if ((!_imageUrlController.text.startsWith('http') &&
              !_imageUrlController.text.startsWith('https')) ||
          (!_imageUrlController.text.endsWith('.png') &&
              !_imageUrlController.text.endsWith('.jpg') &&
              !_imageUrlController.text.endsWith('.jpeg'))) {
        return;
      }
      setState(() {});
    }
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_editedStore.id != null) {
      await Provider.of<Stores>(context, listen: false)
          .updateStore(_editedStore.id, _editedStore);
    } else {
      try {
        await Provider.of<Stores>(context, listen: false)
            .addStore(_editedStore);
      } catch (error) {
        print("ERRRRRPR ");
        print(error);
        print("tab3anaaaah??????????");
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text("error"),
            content: Text('Something went wrong.'),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
  }

// zawdy type 3ashan cuisine page tzbot
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Restaurant'),
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
                        labelText: "Name",
                        //NAME
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _editedStore = Store(
                        id: _editedStore.id,
                        storeTitle: value,
                        rating: _editedStore.rating,
                        location: _editedStore.location,
                        number: _editedStore.number,
                        imageUrl: _editedStore.imageUrl,
                      );
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
                        labelText: "Location",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter data';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _editedStore = Store(
                        id: _editedStore.id,
                        storeTitle: _editedStore.storeTitle,
                        rating: _editedStore.rating,
                        location: value,
                        number: _editedStore.number,
                        imageUrl: _editedStore.imageUrl,
                      );
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
                        labelText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _editedStore = Store(
                        id: _editedStore.id,
                        storeTitle: _editedStore.storeTitle,
                        rating: _editedStore.rating,
                        location: _editedStore.location,
                        number: value,
                        imageUrl: _editedStore.imageUrl,
                      );
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
                        labelText: "Image",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0))),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      _editedStore = Store(
                        id: _editedStore.id,
                        storeTitle: _editedStore.storeTitle,
                        rating: _editedStore.rating,
                        location: _editedStore.location,
                        number: _editedStore.number,
                        imageUrl: value,
                      );
                      print('saved value is $value');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.green[300],
                      // child: MaterialButton(
                      //     minWidth: MediaQuery.of(context).size.width,
                      //     padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      //     onPressed: () {
                      //       // Validate returns true if the form is valid, or false

                      //       // otherwise.
                      //       if (_formKey.currentState.validate()) {
                      //         // If the form is valid, display a Snackbar.

                      //         Scaffold.of(context).showSnackBar(
                      //             SnackBar(content: Text('Processing Data')));
                      //         _formKey.currentState.save();

                      //         _formKey.currentState.reset();
                      //         //                        Navigator.push(
                      //         // context,
                      //         // MaterialPageRoute(builder: (context) =>  appLogic.addStore(Store store)));
                      //       } else {
                      //         Scaffold.of(context).showSnackBar(SnackBar(
                      //             content: Text('Please Fill all Fields')));
                      //       }
                      //       // _formKey.currentState.save();
                      //     },
                      child: MaterialButton(
                        onPressed: _saveForm,
                        child: Text('Submit'),
                      )
                      //push hena
                      //),
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
