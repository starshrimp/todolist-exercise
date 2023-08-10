class Todo
  @@all_todos = []
  @@completed_todos = []
  @@uncompleted_todos = []
  attr_accessor :title, :completed
  def initialize(title, completed)
    @title = title
    @completed = completed
    @@all_todos.push(self)
  end
  def self.list
    @@all_todos
  end

  def self.remove(todo)
    @@all_todos.delete(todo)
  end
  def self.find(todo_title)
    @@all_todos.find do |todo|
      todo.title.include?(todo_title)
    end
  end
  def mark(todo)
    @@all_todos.delete(todo)
    completed = true
    @@all_todos.push(todo)
  end
  def unmark(todo)
    @@all_todos.delete(todo)
    completed = false
    @@all_todos.push(todo)
  end
end