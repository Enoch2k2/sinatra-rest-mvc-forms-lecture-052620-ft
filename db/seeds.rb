Todo.all.each do |todo|
  todo.update(user_id: [1, 2].sample)
end