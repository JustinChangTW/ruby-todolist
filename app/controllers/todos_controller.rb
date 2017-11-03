class TodosController < ApplicationController
    def index
      @todos=Todo.all        
    end

    def new
      @todos=Todo.new
    end

    def create
      @todos = Todo.new(todo_params)
      @todos.save

      redirect_to todos_url
    end

    def show
      @todos = Todo.find(params[:id])
    end

    def edit
      @todos = Todo.find(params[:id])
    end

    def update
      @todos = Todo.find(params[:id])
      @todos.update_attributes(todo_params)

      redirect_to todos_path(@todos)
    end

    private
      
    def todo_params
      params.require(:todo).permit(:name, :due_date, :note)
    end
end
