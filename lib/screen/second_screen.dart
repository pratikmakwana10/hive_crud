import 'package:crud_hive/model/hive_model.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Person? person = box.get('Person');
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              buildSizeBox(10),
              customTextField('Enter your Name.', _nameController),
              buildSizeBox(10),
              customTextField(
                'Enter your Email.',
                _emailController,
              ),
              buildSizeBox(10),
              customTextField(
                'Enter your Job title.',
                _jobTitleController,
              ),
              buildSizeBox(10),
              SizedBox(
                height: 50,
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                        //  if(  _emailController.text == box.values.){}
                            box.add(Person(
                                _nameController.text,
                                _emailController.text,
                                _jobTitleController.text));
                            Navigator.pop(context);
                          }
                        },
                      );
                    },
                    child: const Text("Submit")),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField customTextField(
    String text,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (controller == _emailController &&
            !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return "Please enter valid email";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: text,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade700, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }

  SizedBox buildSizeBox(double height) {
    return SizedBox(
      height: height,
    );
  }
}

//Text("${person?.name} ${person?.email}  ${person?.jobTitle}"),
