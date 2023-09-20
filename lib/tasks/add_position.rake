namespace :add_position do
    task students: :environment do
        students = Student.all.order(:id)
        students.each_with_index do |student, index|
          student.update_column(:position, students[index].id)
        end
      end
end
