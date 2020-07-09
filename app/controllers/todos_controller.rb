class TodosController < ApplicationController
  use Rack::Flash

  get '/todos' do
    @todos = current_user.todos
    erb :'todos/index'
  end
  
  get '/todos/new' do
    @todo = Todo.new
    erb :'todos/new'
  end

  post '/todos' do
    @todo = current_user.todos.build(params[:todo])
    # @user = Todo.build_user()
    if @todo.save
      redirect '/todos'
    else
      flash.now[:error] = @todo.errors.full_messages
      erb :'todos/new'
    end
  end

  get '/todos/:id/edit' do
    set_todo
    if current_user == @todo.user
      erb :'todos/edit'
    else
      redirect '/todos'
    end
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
    if current_user == @todo.user && @todo.update(
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
    if current_user == @todo.user
      @todo.destroy
    end
    redirect '/todos'
  end
  
  private
    def set_todo
      @todo = Todo.find_by_id(params[:id])
    end
end