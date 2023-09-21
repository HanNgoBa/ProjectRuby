module Manager
  class ClassroomsController < ApplicationController
    layout 'class'
    def index
      @classrooms = Classroom.includes(:teacher)
    end

    def show
      @class = Classroom.find_by(id: params[:id])
    end
    
    def new 
      @class = Classroom.new
      @class.teachers.build
    end

    def create
      @class = Classroom.new(class_params)
      if @class.save
        redirect_to manager_classrooms_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @class = Classroom.find(params[:id])
    end

    def update
      @class = Classroom.find(params[:id])
      if @class.update(params)
        redirect_to manager_classrooms_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @class = Classroom.find(params[:id])

      if @class.destroy
        puts "sahcb"
      redirect_to manager_classrooms_path, status: :see_other
      else
        puts @class.errors.full_messages.join(' ')
      end
    end

    private

  end
end
