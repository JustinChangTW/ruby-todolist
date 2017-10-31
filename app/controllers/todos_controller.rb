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

    private

    def todo_params
        params.require(:todo).permit(:name, :due_date, :note)
    end
end
