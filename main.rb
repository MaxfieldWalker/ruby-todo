require "./todo"

subcommand, arg = ARGV

case subcommand
  when "add" then
    if not arg.nil?
      add_todo(arg)
    else
      puts "Todo の内容を指定してください"
    end
  when "complete" then
    if not arg.nil?
      complete_todo(arg)
    else
      puts "完了にしたい Todo の ID を指定してください"
    end
  else
    list_todo()
end
