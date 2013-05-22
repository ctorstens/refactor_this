class TodosController < ApplicationController

  def index
    @todos = Todo.all
    @todo_lists = @todos.map(&:list_name).uniq
  end

  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      update_lists_count(params[:todo][:list_name])
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find params[:id]
    if @todo.update_attributes(params[:todo])
      update_lists_count(params[:todo][:list_name])
      redirect_to @todo
    else
      render :edit
    end
  end

  private

  def update_lists_count(list_name)
    @todos = Todo.where :list_name => list_name
    @todos.each do |todo|
      todo.update_attributes :todo_count => @todos.count
      todo.save
    end
  end

end
