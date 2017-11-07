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
      @parms=todo_params
      if (@parms[:done] == nil)
        @parms[:done] = false
      end
      @todos.update_attributes(@parms)

      redirect_to todos_path(@todos)
    end

    def destroy
      @todos = Todo.find(params[:id])
      @todos.destroy

      redirect_to todos_url
    end
     

    private

    def todo_params
      params.require(:todo).permit(:name, :due_date, :note, :done)
    end
end
