class TodosController < ApplicationController

    # action中重覆執行的動作利用before_action，將覆重式碼注入（掛勾）
    before_action :set_todo, :only => [:show,:edit,:update,:destroy]
    def index
      @todos=Todo.all        
    end

    def new
      @todos=Todo.new
    end

    def create
      @parms=todo_params
      if (@parms[:done] == nil)
        @parms[:done] = false
      end
      @todos = Todo.new(@parms)
      if @todos.save
        redirect_to todos_url
      else
        render :action => :new
      end
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
      
      if @todos.update_attributes(@parms)
        redirect_to todos_path(@todos)
      else
        render :action => :edit
      end
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

    # 將常用的程式碼抽出作方法
    def set_todo
      @todo = Todo.find(params[:id])
    end

end
