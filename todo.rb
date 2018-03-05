require 'json'
require './idgen'

def list_todo()
  todos = restore_todos()
  todos.each {|todo|
    id = todo["id"]
    subject = todo["subject"]
    checkmark = todo["completed"] ? "☑" : "  "
    puts "#{checkmark}  [#{id}]  #{subject}"
  }
end

def add_todo(subject)
  todos = restore_todos
  new_todo = {
      "id": generate_id(),
      "subject": subject,
      "completed": false
  }
  todos.push(new_todo)
  File.open("./todo.json", "w:UTF-8") do |file|
    file.write(JSON.pretty_generate(todos))
  end
end

def complete_todo(todo_id)
  todos = restore_todos()
  todo_to_complete = todos.find {|x| x["id"] == todo_id}
  if todo_to_complete.count > 0
    todo_to_complete["completed"] = true
    File.open("./todo.json", "w:UTF-8") do |file|
      file.write(JSON.pretty_generate(todos))
    end
  else
    puts "ID に該当する Todo がありません"
  end
end

def restore_todos
  if File.exist?("./todo.json")
    File.open("./todo.json", "r:UTF-8") do |json_file|
      return JSON.load(json_file)
    end
  else
    return []
  end
end
