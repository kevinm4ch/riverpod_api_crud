class Todo {
  String description;
  bool completed;

  Todo({
    required this.description,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        description: json["description"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "completed": completed,
      };

  
}
