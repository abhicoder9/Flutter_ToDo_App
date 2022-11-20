class ToDo {
  String id;
  String todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todosList() {
    return [
      ToDo(id: '1', todoText: 'Morning Exercises', isDone: true),
      ToDo(id: '2', todoText: 'Breakfast', isDone: true),
      ToDo(id: '3', todoText: 'Programming', isDone: true),
      ToDo(id: '4', todoText: 'Lunch With Girlfried', isDone: true),
      ToDo(id: '5', todoText: 'Buy Groceries', isDone: true),
      ToDo(id: '6', todoText: 'Team Meeting', isDone: true),
      ToDo(id: '7', todoText: 'Morning Exercises'),
      ToDo(id: '8', todoText: 'Morning Exercises'),
      ToDo(id: '9', todoText: 'Morning Exercises'),
      ToDo(id: '10', todoText: 'Morning Exercises'),
    ];
  }
}
