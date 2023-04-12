import 'package:crud_hive/model/hive_model.dart';
import 'package:crud_hive/screen/second_screen.dart';
import 'package:crud_hive/screen/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/adapters.dart';
import '../main.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Person> allHiveUser = [];
  @override
  void initState() {

    for (var element in box.values) {
      allHiveUser.add(element);
    }

    // TODO: implement initState
    super.initState();
  }

  _deleteInfo(int index) async {
    allHiveUser.removeAt(index);
    await box.deleteAt(index);
  }
   emailCheck(){
     allHiveUser.contains(allHiveUser.singleWhere((element) => false));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        title: const Text("Hive"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
            valueListenable: box.listenable(),
            builder: (context, Box box, widget) {
              if (box.isEmpty) {
                return const Center(
                  child: Text('Empty'),
                );
              } else {
                return ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: allHiveUser.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        child: Slidable(
                          startActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) => _deleteInfo(index),
                                backgroundColor: Colors.grey,
                                foregroundColor: Colors.redAccent,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const ScrollMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (context) {
                                  Navigator.push(
                                      context,
                                      (MaterialPageRoute(
                                          builder: (context) =>  Update(
                                              singleUser:  allHiveUser[index],
                                            index: index,
                                          )))).then((value){
                                            allHiveUser.clear();
                                            for (var element in box.values) {
                                              allHiveUser.add(element);
                                              setState(() {
                                              });
                                            }
                                  });
                                },
                                backgroundColor:  Colors.grey,
                                foregroundColor: Colors.blueAccent,
                                icon: Icons.update,
                                label: 'Update',
                              ),
                            ],
                          ),
                          child: ListTile(
                            tileColor: Colors.grey.shade700,
                            textColor: Colors.white60,
                            // leading: Text(singleUser[index].toString()),
                            title: Text(allHiveUser[index].name),
                            subtitle: Text(allHiveUser[index].email),
                            trailing: Text(allHiveUser[index].jobTitle),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()))
              .then((value) {
            allHiveUser.clear();
            for (var element in box.values) {
              allHiveUser.add(element);
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
