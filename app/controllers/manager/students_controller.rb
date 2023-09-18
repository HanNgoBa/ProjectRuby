# frozen_string_literal: true

module Manager
  class StudentsController < ApplicationController
    def index
      @students = if params[:search]
                    @search = params[:search]
                    @subject = params[:subject]
                    query = Student.includes(:grades)
                    # .joins(:grades)
                    query = query.where('students.name LIKE ?', "%#{@search}%")
                    if @subject.present?
                      query = query.where('grades.subject = ?', @subject)
                    end
                    query.page params[:page]
                  else
                    Student.includes(:grades).page params[:page]
                  end
      
      # @students = if params[:search]
      #   @search = params[:search]
      #   query = Student.joins(:grades).where('students.name LIKE ?', "%#{@search}%")
      #   if params[:subject]
      #     @subject = params[:subject]
      #     query = query.where('grades.subject = ?', @subject)
      #   end
      #   query.page params[:page]
      # else
      #   Student.all.page params[:page]
      # end
    end

    def show
      @student = Student.find_by(params[id: params[:id]])
    end

    def new
      @student = Student.new
      @student.grades.build
    end

    def create
      @student = Student.new(student_params)
      if @student.save
        redirect_to manager_students_url
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @student = Student.find(params[:id])
    end

    def update
      @student = Student.find(params[:id])
      if @student.update(student_params)
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
      id = params[:id]
      @restored_student = Student.restore(id, :recursive => true)
      raise "I am here"
      redirect_to manager_student_deleted_path, notice: "Student was restored", method: :PUT

    end

    def permanently_delete
      @student = Student.only_deleted.find(params[:id])
      @student.really_destroy!
      redirect_to manager_student_deleted_path, notice: "Student has been permanently deleted"
    end

    private

    def student_params
      params.require(:student).permit(:name, :age, :phone, :avatar, :video, :song,
                                      grades_attributes: %i[id subject semester score])
    end
  end
end
