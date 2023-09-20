module Manager
    class StudentService
        def initialize(student = nil)
          @student = student
        end

        def get_student(params)
            if params[:search]
                @search = params[:search]
                @subject = params[:subject]
                query = Student.includes(:grades)
                query = query.where('students.name LIKE ?', "%#{@search}%")
                if @subject.present?
                  query = query.where(grades: {subject: @subject} )
                end
                query.order(:position).page params[:page]
              else
                Student.includes(:grades).order(:position).page params[:page]
              end
        end

        def create_student(params)
            @student.assign_attributes(params)
            if @student.save
                return true
            else
                return false
            end
        end

        def update_student(params)
            if @student.update(params)
                return true
            else
                return false
            end
        end

        def delete_student()
            @student.destroy
        end
    end
end