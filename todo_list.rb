require './storage'
require "debug"

class TodoList
  FILENAME = 'todo_list.csv'
  def initialize
    @storage = Storage.new(FILENAME)
    @todos = @storage.load
  end

  def print_todos
    Todo.list.each do |todo|
      puts "#{todo.title} (completed: #{todo.completed})"
    end
  end

  def add(title)
    Todo.new(title, false)
  end

  def remove(title)
    found_title = Todo.find(title)
    Todo.remove(found_title)
  end

  def mark(title)
    todo = Todo.list.find { |todo| todo.title.include?(title) }
    if todo
      todo.completed = true
      puts "'#{todo.title}' marked as completed."
      todo.mark(todo)
    else
      puts "Todo with title '#{title}' could not be found."
    end
  end

  def unmark(title)
    todo = Todo.list.find { |todo| todo.title == title }
    if todo
      todo.completed = false
      puts "'#{todo.title}' marked as not completed."
      todo.unmark(todo)
    else
      puts "Todo with title '#{title}' could not be found."
    end
  end

  def save
    @storage.save(@@all_todos)
  end
end

todo_list = TodoList.new


def readline
  gets.chomp
end

puts 'Type help for listing all commands.'
loop do
  command = readline
  case command
  when 'help'
    puts 'help: Print this help'
    puts 'list: List all todos'
    puts 'add: Add a new todo'
    puts 'remove: Remove an existing todo'
    puts 'mark: Mark a todo as completed'
    puts 'unmark: Unmark a completed todo'
    puts 'exit: Exit the application and saves all todos'
  when 'list'
    todo_list.print_todos
  when 'add'
    puts 'Enter the title of the todo:'
    title = readline
    todo_list.add(title)
    todo_list.print_todos
  when 'remove'
    puts 'Enter the title of the todo:'
    title = readline
    todo_list.remove(title)
    todo_list.print_todos
  when 'mark'
    puts 'Enter the title of the todo:'
    title = readline
    todo_list.mark(title)
  when 'unmark'
    puts 'Enter the title of the todo:'
    title = readline
    todo_list.unmark(title)
  when 'exit'
    todo_list.save
    exit
  end
end
