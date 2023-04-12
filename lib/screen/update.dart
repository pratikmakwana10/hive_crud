import 'package:crud_hive/model/hive_model.dart';
import 'package:flutter/material.dart';

import '../main.dart';


class Update extends StatefulWidget {
  Person singleUser;
  int index ;
  Update({
    required this.singleUser,
    required this.index,
    Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}


class _UpdateState extends State<Update> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController job = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();

  _updateInfo() {
    Person newPerson = Person(name.text, email.text, job.text,);
    print(newPerson);

    box.putAt(widget.index, newPerson);
    for (var ok in box.values) {
      print(ok);
    }
    //  box.put(newPerson);


  }

  @override
  void initState() {
    name.text = widget.singleUser.name;
    email.text = widget.singleUser.email;
    job.text = widget.singleUser.jobTitle;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
// print(widget.singleUser);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _personFormKey,
          child: Column(
            children: [
              buildSizedBox(),
              customTextField("name", name),
              buildSizedBox(),
              customTextField("email", email),
              buildSizedBox(),
              customTextField("job", job),
              buildSizedBox(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: ElevatedButton(onPressed: () {
                    _updateInfo();
                    if (_personFormKey.currentState!.validate()) {
                      _updateInfo();
                      Navigator.of(context).pop();
                    }
                  }, child: const Text("Update")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() =>
      const SizedBox(
        height: 10,
      );


  TextFormField customTextField(String text,
      TextEditingController controller,) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        if (controller == email && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return "Please enter valid email";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: text,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade700, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }

}
