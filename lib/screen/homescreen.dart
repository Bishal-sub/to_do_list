import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Map<String, dynamic>> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.list)),
        title: Text("To Do List"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                TextEditingController controller = TextEditingController();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Enter your task"),
                    content: TextField(
                      controller: controller,
                    ),
                    actions: [
                      IconButton(
                          onPressed: () {
                            // if (controller.text.isNotEmpty) {
                            //   setState(() {
                            //     items.add({
                            //       'title': controller.text,
                            //       'isChecked': false,
                            //     });
                            //   });
                            //   Navigator.pop(context);
                            // }
                          },
                          icon: ElevatedButton.icon(
                            onPressed: () {
                              if (controller.text.isNotEmpty) {
                                setState(() {
                                  items.add({
                                    'title': controller.text,
                                    'isChecked': false,
                                  });
                                });
                                Navigator.pop(context);
                              }
                            },
                            label: Text("Add as task"),
                            icon: Icon(Icons.add),
                          ))
                    ],
                  ),
                );
              },
              icon: Icon(Icons.edit_off))
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                focusColor: Colors.black,
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          ),
          Text(
            "All ToDos",
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.right,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final task = items[index];
                return Card(
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(
                      task['title'],
                      style: TextStyle(
                        decoration: task['isChecked']
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    leading: Checkbox(
                      value: task['isChecked'],
                      onChanged: (bool? value) {
                        setState(() {
                          task['isChecked'] = value!;
                        });
                      },
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          items.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          TextEditingController controller = TextEditingController();
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Enter your task"),
              content: TextField(
                controller: controller,
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      // if (controller.text.isNotEmpty) {
                      //   setState(() {
                      //     items.add({
                      //       'title': controller.text,
                      //       'isChecked': false,
                      //     });
                      //   });
                      //   Navigator.pop(context);
                      // }
                    },
                    icon: ElevatedButton.icon(
                      onPressed: () {
                        if (controller.text.isNotEmpty) {
                          setState(() {
                            items.add({
                              'title': controller.text,
                              'isChecked': false,
                            });
                          });
                          Navigator.pop(context);
                        }
                      },
                      label: Text("Add as task"),
                      icon: Icon(Icons.add),
                    ))
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
