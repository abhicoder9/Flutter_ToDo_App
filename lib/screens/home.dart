import 'package:flutter/material.dart';
import '../models/todoitem.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todosList();
  List<ToDo> foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 246, 255),
        appBar: _appBar(),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(children: [
            searchBar(),
            Expanded(
              child: ListView(children: [
                Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    child: const Text('All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w900))),
                for (ToDo todoo in foundToDo.reversed)
                  ToDoitem(
                    todo: todoo,
                    onToDoChanged: _todoChange,
                    deleteToDoItem: _deleteToDoItem,
                  ),
              ]),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 10.0,
                                spreadRadius: 0.0),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _todoController,
                          decoration: const InputDecoration(
                            hintText: 'Add a new todo item',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          _addToDoItem(_todoController.text);
                        },
                        child: const Text('+', style: TextStyle(fontSize: 40)),
                      ),
                    ),
                  ],
                ))
          ]),
        ));
  }

  void _todoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(
        ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo,
        ),
      );
    });
    _todoController.clear();
  }

  void runFilter(String enteredKeyword) {
    List<ToDo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundToDo = results;
    });
  }

  //Search bar
  Widget searchBar() {
    return Container(
        padding: const EdgeInsets.only(left: 20),
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: TextField(
            onChanged: (value) => runFilter(value),
            decoration: const InputDecoration(
              prefixIcon: (Icon(Icons.search, size: 25, color: Colors.black)),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20, minWidth: 30),
              border: InputBorder.none,
              hintText: 'Search',
            )));
  }

//APP BAR
  AppBar _appBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 242, 246, 255),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            ),
            SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('abhi.jpg')))
          ],
        ));
  }
}
