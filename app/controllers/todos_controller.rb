class TodosController < ApplicationController
  get '/todos' do
    @todos = current_user.todos
    erb :'todos/index'
  end
  
  get '/todos/new' do
    @todo = Todo.new
    erb :'todos/new'
  end

  post '/todos' do
    @todo = Todo.new(params[:todo])
    if @todo.save
      redirect '/todos'
    else
      erb :'todos/new'
    end
  end

  get '/todos/:id/edit' do
    set_todo
    erb :'todos/edit'
  end

  get '/todos/:id' do
    set_todo
    if @todo
      erb :'todos/show'
    else
      redirect '/todos'
    end
  end

  patch '/todos/:id' do
    set_todo
    if @todo.update(
          title: params[:todo][:title],
          completed: params[:todo][:completed]
       )
      redirect "/todos/#{@todo.id}"
    else 
      erb :'todos/edit'
    end
  end

  delete '/todos/:id' do
    set_todo
    @todo.destroy
    redirect '/todos'
  end
  
  private
    def set_todo
      @todo = Todo.find_by_id(params[:id])
    end
end