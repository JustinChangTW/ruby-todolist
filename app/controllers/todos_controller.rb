class TodosController < ApplicationController
    def index
        @todos=Todo.all        
    end

    def new
        @todos=Todo.new
    end
end
