import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/todo_provider.dart';
import 'package:todoapp/views/add_todo.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<TodoProvider>(context, listen: false).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () => addDataWidget(context), child: Icon(Icons.add)),
      appBar: AppBar(
        title: Text("TODO List"),
        centerTitle: true,
      ),
      body: Container(
        child: Consumer<TodoProvider>(
          builder: (context, model, _) => FutureBuilder(
              future: model.fetchData(),
              builder: (context, snapshot) => ListView.builder(
                  itemCount: model.todoData.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      onTap: () {
                        print(model.todoData[index]);
                      },
                      title: Text(model.todoData[index]['title']),
                      subtitle: Text(model.todoData[index]['description']),
                    );
                  })),
        ),
      ),
    );
  }
}
