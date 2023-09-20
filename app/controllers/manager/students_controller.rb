# frozen_string_literal: true

module Manager
  class StudentsController < ApplicationController
    def index
      student_sv = StudentService.new
      @students = student_sv.get_student(params)
    end

    def show
      @student = Student.find_by(id: params[:id])
    end

    def new
      @student = Student.new
      @student.grades.build
    end

    def create
      @student = Student.new
      student_sv = StudentService.new(@student)

      if student_sv.create_student(student_params)
        redirect_to manager_students_url
      else
        render :new, status: :unprocessable_entity
      end

      # @student = Student.new(student_params)
      # if @student.save
      #   redirect_to manager_students_url
      # else
      #   render :new, status: :unprocessable_entity
      # end
    end

    def edit
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find(params[:id])
      student_sv = StudentService.new(@student)

      if student_sv.update_student(student_params)
        redirect_to manager_students_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @student = Student.find(params[:id])
      @student.destroy
      redirect_to manager_students_path, status: :see_other
    end

    def student_deleted
      @student_deleteds = Student.only_deleted
    end

    def student_restore
      @student = Student.only_deleted.find(params[:id])
      @restored_student = @student.restore!(recursive: true)
      redirect_to manager_student_deleted_path, notice: "Student was restored"
    end

    def permanently_delete
      @student = Student.only_deleted.find(params[:id])
      @student.really_destroy!
      redirect_to manager_student_deleted_path, notice: "Student has been permanently deleted"
    end

    def move_lower
      @student = Student.find(params[:id])
      student_posti = Student.where("position > ?", @student.position).order("position ASC").first
      if student_posti
        temp_position = student_posti.position
        student_posti.update_column(:position, @student.position)
        @student.update_column(:position, temp_position)
      end
      redirect_to manager_students_path
      # @student.move_lower
      # manager_students_path
    end

    def move_higher
      @student = Student.find(params[:id])
      student_posti = Student.where("position < ?", @student.position).order("position DESC").first
      if student_posti
        temp_position = student_posti.position
        student_posti.update_column(:position, @student.position)
        @student.update_column(:position, temp_position)
      end
      redirect_to manager_students_path
      # @student.move_higher
      # manager_students_path
    end

    private

    def student_params
      params.require(:student).permit(:name, :age, :phone, :avatar, :video, :song,
                                      grades_attributes: %i[id subject semester score])
    end
  end
end
