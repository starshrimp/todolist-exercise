require 'csv'
require './todo'

class Storage
  def initialize(filename)
    @filename = filename
  end

  def load
    todos = []
    CSV.foreach(@filename) do |row|
      todos << Todo.new(row[0], row[1])
    end

    todos
  end

  def save_in_csv(filename, todos)
    CSV.open(filename, 'wb') do |csv|
      todos.each do |todo|
        csv << [todo.title, todo.completed]
      end
    end
  end
  def save_in_html(filename, content)
    File.open(filename, "w") do |file|
      file.write(content)
    end
  end

end
